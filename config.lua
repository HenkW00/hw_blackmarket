Config = {}

Config.DiscordWebhook = "https://discord.com/api/webhooks/1212185804412026931/X6APtf8ALmtGzSwLfWYico89UpURpnnT7ams3AaXuY9HbBJMp3SSrmtVFZJcb9XC143u"
Config.Debug = true
Config.checkForUpdates = true

Config.BlackMarketPed = {
    coords = vector4(214.09, -815.29, 30.69, 72.74), 
    model = 'a_m_m_og_boss_01',
    animation = {dict = "mini@strip_club@idles@bouncer@base", name = "base"},
}

Config.Categories = {
    { label = "Items", value = "items" },
    { label = "Weapons", value = "weapons" },
    { label = "Drugs", value = "drugs" }
}

Config.Items = {
    ['items'] = {
        {label = "Lockpick", item = "lockpick", price = 100},
        {label = "Ammo-9", item = "ammo-9", price = 100}
    },
    ['weapons'] = {
        {label = "Switchblade", item = "weapon_switchblade", price = 35000},
        {label = "Pistol", item = "weapon_pistol", price = 50000}
    },
    ['drugs'] = {
        {label = "Weed", item = "cannabis", price = 100},
        {label = "Meth", item = "meth", price = 100}
    },
}