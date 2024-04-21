lib.locale()

Config = {}

---------------------
---SCRIPT SETTINGS---
---------------------
Config.Debug = true -- For debugging purposes (it will show both server and client output)
Config.checkForUpdates = true -- Recommended to leave as "true" for upcomming updates ;)
Config.Logs = true -- Do you want to send discord logs for actions taken by players?

------------------------------
----EDITABLE TEXT SETTINGS----
------------------------------
Config.AmountText = 'Enter quantity:' -- Text you can change for the quantity UI

------------------
---PED SETTINGS---
------------------
Config.Location = vector4(-52.919, -2523.829, 6.401, 52.098) -- Location for the ped to be spawned
Config.Ped = 'u_m_m_jewelsec_01' -- Ped model for the blackmarket

------------------------------
----BLACKMARKET SHOP ITEMS----
------------------------------
Config.Items = {
    {label = 'Drill', item = 'drill', price = 3500, icon = 'fas fa-tools'},
    {label = 'Handcuffs', item = 'handcuffs', price = 2000, icon = 'fas fa-handcuffs'},
    {label = 'Lockpick', item = 'lockpick', price = 1000, icon = 'fas fa-key'},
    {label = 'Thermite', item = 'thermite', price = 7500, icon = 'fas fa-fire'},
    {label = 'Blowtorch', item = 'blowtorch', price = 10000, icon = 'fas fa-fire-alt'},
    {label = 'White Card', item = 'whitecard', price = 10000, icon = 'fas fa-credit-card'},
    {label = 'Race Tablet', item = 'racetablet', price = 15000, icon = 'fas fa-tablet-alt'},
    {label = 'Hacking Laptop', item = 'hacking_laptop', price = 15000, icon = 'fas fa-laptop'},
    {label = 'Big Drill', item = 'big_drill', price = 20000, icon = 'fas fa-tools'},
}

Config.Others = {
    {label = 'Crack Kit', item = 'crack_kit', price = 20000, icon = 'fas fa-hammer'},
    {label = 'C4 Bomb', item = 'c4_bomb', price = 20000, icon = 'fas fa-bomb'},
    {label = 'Hacking USB', item = 'hack_usb', price = 20000, icon = 'fas fa-usb'},
    {label = 'Hack Telefoon', item = 'hacktelefoon', price = 20000, icon = 'fas fa-mobile-alt'},
    {label = 'Gas Mask', item = 'gas_mask', price = 20000, icon = 'fas fa-gas-mask'},
    {label = 'Fake Plate', item = 'fakeplate', price = 40000, icon = 'fas fa-car'},
    {label = 'Armor (lvl1)', item = 'armorl1', price = 75000, icon = 'fas fa-shield-alt'},
    {label = 'Armor (lvl2)', item = 'armorl2', price = 125000, icon = 'fas fa-shield-alt'},
    {label = 'Armor (lvl3)', item = 'armorl3', price = 200000, icon = 'fas fa-shield-alt'},
}

----------------------------
----DISCORD LOG SETTINGS----
----------------------------
Config.Webhook = 'https://discord.com/api/webhooks/1212185804412026931/X6APtf8ALmtGzSwLfWYico89UpURpnnT7ams3AaXuY9HbBJMp3SSrmtVFZJcb9XC143u' -- Webhook URL for logging to discord :)
Config.DiscordBotName = 'HW Scripts' -- Name of the bot (You can change it ofcours)
Config.DiscordLogTitle = '🛒 Blackmarket' -- Title of the log message (You can change it ofcours)
Config.DiscordLogFooter = 'HW Development | Logs' -- Footer text of the log (You can change it ofcours)
Config.DiscordLogColour = 0xFF0000 -- Colour for the log (You can change it ofcours)
Config.DiscordEmbedStyle = 'rich' -- Embed style that will be used (DONT REALLY NEED TO CHANGE THIS)