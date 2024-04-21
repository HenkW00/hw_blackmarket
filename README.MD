# HW Scripts - Black Market (Rewritten)

**Description**

This is an advanced blackmarket script designed to enhance illegal trading RP. The script has been rewritten by HW Development for compatibility with the latest ESX updates.

**Author**
- HW Development | HenkW

**Changelog:**
- Added Config.Ped to config.lua to for easy configuration.
- Added Config.AmountText to config.lua for easy configuration.
- Added Config.DiscordBotName to config.lua for easy configuration.
- Added Config.DiscordLogTitle to config.lua for easy configuration.
- Added Config.DiscordLogFooter to config.lua for easy configuration.
- Added Config.DiscordLogColour to config.lua for easy configuration.
- Added Config.DiscordEmbedStyle to config.lua for easy configuration.
- Added Config.Logs so you can choose if you want to use discord logging.
- Added Config.DebugLogs so you can choose if you want to log the debug prints to disord.
- Changed the config.lua so its more readable.
- Changed logging helper function.
- Changed client-side handlers for ped configuration.
 
🛠 **Requirements**
- ESX Server
- OX Lib
- OX Inventory

🌐 **Requirements Download links**
- es_extended: [https://github.com/esx-framework/esx_core]
- ox_lib: [https://github.com/overextended/ox_lib]
- ox_inventory: [https://github.com/overextended/ox_inventory]

✅ **Features**
- Players can access the black market to purchase illegal items.
- Server administrators can enable debug mode to receive detailed outputs.
- Discord logging is available for better moderation (config.webhook).
- Optimized performance for both client-side and server-side operations.
- Enhanced readability and maintainability of the script code.
- Supports the latest version of ESX.

🔧 **Download & Installation**

Follow these steps to set up the black market script on your ESX server:

1. **Download the Files**: Download the script files from the provided source.

2. **Copy to Server Resource Directory**: Place the `hw_blackmarket` folder in the server resource directory.

3. **Update `server.cfg`**: Add the following line to your `server.cfg` file:

    ```cfg
    start hw_blackmarket
    ```

4. **Start Your Server**: Restart or start your ESX server to load the `hw_blackmarket` resource.

Enjoy the script! <3
