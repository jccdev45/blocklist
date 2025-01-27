-- Community Blocklist Plugin (Simplified)

local community_blocklist = {
  "Pepe_The_Toad", "bholinaagin", "ijustfarded420", "mizkifismyfriend",
  "HeyImEllieGirl", "MaybePerhapsThisOne", "ArtifactAddict", "cuckoo2001",
  "mtenderizer", "dimma7", "g_a_l_v_a", "StreamAnalMint", "wholesomeguy03",
  "satedbanana"
}

-- Blocklist management functions
local function blockUser(ctx, username)
  ctx.channel:send_message("/block " .. username, true)
  ctx.channel:add_system_message("Blocked user: " .. username)
end

local function unblockUser(ctx, username)
  ctx.channel:send_message("/unblock " .. username, true)
  ctx.channel:add_system_message("Unblocked user: " .. username)
end

-- Command functions
local function cmdBlockall(ctx)
  for _, username in ipairs(community_blocklist) do
    blockUser(ctx, username)
  end
  ctx.channel:add_system_message("Blocked all users in the community blocklist.")
end

local function cmdUnblockall(ctx)
  for _, username in ipairs(community_blocklist) do
    unblockUser(ctx, username)
  end
  ctx.channel:add_system_message("Unblocked all users in the community blocklist.")
end

local function cmdListblocklist(ctx)
  ctx.channel:add_system_message("Community Blocklist:")
  for _, username in ipairs(community_blocklist) do
    ctx.channel:add_system_message("- " .. username)
  end
end

local function cmdBlockhelp(ctx)
  ctx.channel:add_system_message("Community Blocklist Commands:")
  ctx.channel:add_system_message("/blockall - Block all users in the community list")
  ctx.channel:add_system_message("/unblockall - Unblock all users in the community list")
  ctx.channel:add_system_message("/showblocklist - Show the community blocklist")
end

-- Register commands
c2.register_command("/blockall", cmdBlockall)
c2.register_command("/unblockall", cmdUnblockall)
c2.register_command("/showblocklist", cmdListblocklist)
c2.register_command("/blockhelp", cmdBlockhelp)

print("🔒 Community Blocklist Plugin loaded!")
