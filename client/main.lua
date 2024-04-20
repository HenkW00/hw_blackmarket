lib.locale()

-- Variables
items = {}
others = {}

-- Function to prompt the player for quantity input
local function promptQuantity(callback)
    local amount = nil
    AddTextEntry("FMMC_KEY_TIP8", "Enter quantity:")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 3)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(20)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        amount = GetOnscreenKeyboardResult()
    end

    callback(amount)
end

-- Function to create menu options for items with quantity selection
local function createItemOption(label, price, callback)
    return {
        title = label,
        icon = 'fa-solid fa-shopping-basket',
        iconColor = '#0000FF',
        description = locale('price'):format(price.."$"),
        onSelect = function()
            promptQuantity(function(quantity)
                if quantity and tonumber(quantity) then
                    callback(tonumber(quantity))
                else
                    TriggerEvent('chatMessage', '^1Error:^0 Invalid quantity.')
                end
            end)
        end
    }
end

-- Main event for opening blackmarket menu
RegisterNetEvent('hw_blackmarket:openbm', function ()
    lib.registerContext({
        id = 'hw_blackmarket_bm',
        title = locale('bm'),
        options = {
            {
                title = locale('items'),
                icon = 'tags',
                description = locale('items_desc'),
                event = 'hw_blackmarket:openbmitems',
                arrow = 'true'
            },
            {
                title = locale('others'),
                icon = 'tags',
                description = locale('others_desc'),
                event = 'hw_blackmarket:openbmothers',
                arrow = 'true'
            }
        }
    })
    lib.showContext('hw_blackmarket_bm')
end)

-- Main event for opening 'items' sections
RegisterNetEvent('hw_blackmarket:openbmitems', function ()
    lib.registerContext({
        id = 'hw_blackmarket_bmitems',
        title = locale('items_title'),
        menu = 'hw_blackmarket_bm',
        options = items
    })
    lib.showContext('hw_blackmarket_bmitems')
end)

-- Main event for opening 'others' sections
RegisterNetEvent('hw_blackmarket:openbmothers', function ()
    lib.registerContext({
        id = 'hw_blackmarket_bmothers',
        title = locale('others_title'),
        menu = 'hw_blackmarket_bm',
        options = others
    })
    lib.showContext('hw_blackmarket_bmothers')
end)

-- Debug print for checking items from config file
if Config.Debug then
    print("^0[^1DEBUG^0] ^5Initialized items from config file")
    print("^3", json.encode(Config.Items))
end

-- Populate menu options for each item with quantity selection
for k, v in pairs(Config.Items) do 
    if Config.Debug then
        print("^0[^1DEBUG^0] ^5Checking 'items' from config:^3", v.label)
    end
    table.insert(items, createItemOption(v.label, v.price, function(quantity)
        Wait(20)
        local itemName = v.item
        local itemPrice = v.price
        TriggerServerEvent('hw_blackmarket:buyItem', itemName, itemPrice, quantity)
    end))
end

for k, v in pairs(Config.Others) do 
    if Config.Debug then
        print("^0[^1DEBUG^0] ^5Checking 'others' from config:^3", v.label)
    end
    table.insert(others, createItemOption(v.label, v.price, function(quantity)
        Wait(20)
        local itemName = v.item
        local itemPrice = v.price
        TriggerServerEvent('hw_blackmarket:buyItem', itemName, itemPrice, quantity)
    end))
end

local BlackMarketPed = {
    Ped = {
        {hash = "u_m_m_jewelsec_01" , coords = Config.Location},
    }
}

-- Main thread for spawning blackmarket ped and using it
Citizen.CreateThread(function ()
    for _, v in pairs(BlackMarketPed.Ped) do 
        local hash = GetHashKey(v.hash)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("hw_blackmarket", v.hash, v.coords, false, true)
        exports.ox_target:addLocalEntity(ped, {
            {
                name = 'hw_blackmarket:targetbm',
                event = 'hw_blackmarket:openbm',
                icon = 'fa-solid fa-person-rifle',
                label = locale('talk'),
            }
        })
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
    end
end)
