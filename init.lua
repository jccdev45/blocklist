-- Community Blocklist Plugin (Updated)

local community_blocklist = {}
local blocklist_url = "https://raw.githubusercontent.com/jccdev45/blocklist/main/blocklist.txt"

-- Blocklist management functions
local function blockUser(ctx, username)
  ctx.channel:send_message("/block " .. username, true)
end

local function unblockUser(ctx, username)
  ctx.channel:send_message("/unblock " .. username, true)
end

local function fetchBlocklist(callback)
  local request = c2.HTTPRequest.create(c2.HTTPMethod.Get, blocklist_url)

  request:set_timeout(5000)

  request:on_success(function(res)
    local data = res:data()
    if res:status() == 200 then
      community_blocklist = {} -- Clear the existing list
      for username in data:gmatch("[^\r\n]+") do
        table.insert(community_blocklist, username)
      end
      c2.log(c2.LogLevel.Info, "Blocklist updated successfully")
      if callback then
        callback(true)
      end
    else
      c2.log(c2.LogLevel.Warning, "Failed to fetch blocklist")
      if callback then
        callback(false)
      end
    end
  end)

  request:on_error(function(error)
    c2.log(c2.LogLevel.Warning, "Error fetching blocklist: " .. error)
    if callback then
      callback(false)
    end
  end)

  request:execute()
end

-- Command functions
local function cmdBlockall(ctx)
  ctx.channel:add_system_message("Blocking users...")
  fetchBlocklist(function(success)
    if success then
      for _, username in ipairs(community_blocklist) do
        blockUser(ctx, username)
      end
    else
      ctx.channel:add_system_message("Failed to fetch the blocklist. Please try again later.")
    end
  end)
end

local function cmdUnblockall(ctx)
  ctx.channel:add_system_message("Unblocking users...")
  fetchBlocklist(function(success)
    if success then
      for _, username in ipairs(community_blocklist) do
        unblockUser(ctx, username)
      end
    else
      ctx.channel:add_system_message("Failed to fetch the blocklist. Please try again later.")
    end
  end)
end

local function cmdListblocklist(ctx)
  fetchBlocklist(function(success)
    if success then
      ctx.channel:add_system_message("Community Blocklist: " .. blocklist_url)
    else
      ctx.channel:add_system_message("Failed to fetch the community blocklist. Please try again later.")
    end
  end)
end

local function cmdBlockhelp(ctx)
  ctx.channel:add_system_message("Community Blocklist Commands:")
  ctx.channel:add_system_message("/blockall - Block all users in the community list")
  ctx.channel:add_system_message("/unblockall - Unblock all users in the community list")
  ctx.channel:add_system_message("/showblocklist - Show the community blocklist URL")
end

-- Register commands
c2.register_command("/blockall", cmdBlockall)
c2.register_command("/unblockall", cmdUnblockall)
c2.register_command("/showblocklist", cmdListblocklist)
c2.register_command("/blockhelp", cmdBlockhelp)

print("🔒 Community Blocklist Plugin loaded!")
