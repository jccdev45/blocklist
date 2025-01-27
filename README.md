# Community Blocklist

## Table of Contents

- [Community Blocklist](#community-blocklist)
  - [Table of Contents](#table-of-contents)
    - [About ](#about-)
    - [Prerequisites](#prerequisites)
  - [Installing](#installing)
  - [Troubleshooting](#troubleshooting)
  - [Usage ](#usage-)

### About <a name = "about"></a>

A plugin to maintain a community blocklist for Chatterino.

### Prerequisites<a name = "prerequisites"></a>

Chatterino v2.5.2 (or a version that has plugin support). You can find the section for Plugins on the left side of the settings menu.

## Installing<a name = "installing"></a>

- Ensure your version of Chatterino has plugin support (as of v2.5.2) *(Note that plugins are currently in alpha and are subject to change)*
- Either clone this repo or just [direct download](https://github.com/jccdev45/blocklist/archive/refs/heads/main.zip)
- Place the folder (containing `init.lua`, `info.json`, etc) into `<username>/AppData/Roaming/Chatterino2/Plugins` so that you have it directly in `/Plugins`.
- Click `Enable` on the plugin in Chatterino Settings -> Plugins.

## Troubleshooting<a name = "troubleshooting"></a>

- If you don't see the plugin listed, verify that the location of the downloaded folder is inside `/Plugins` and restart Chatterino. Any additional nested folders *will not* be recognized.

## Usage <a name = "usage"></a>

- `/blockhelp`: list all commands
- `/blockall`: block all users on the current list
- `/unblockall`: unblock all users on the current list
- `/showblocklist`: display the current blocklist
