ESX = exports["es_extended"]:getSharedObject()

lib.locale()

-- Main function for discord logging
local function sendLog(playerIdentifier, message)
    if Config.Logs and Config.Webhook ~= "" then
    
        local embeds = {
            {
                title = Config.DiscordLogTitle or "🛒 Blackmarket",
                description = message,
                type = Config.DiscordEmbedStyle or "rich",
                color = Config.DiscordLogColour or 0xFF0000,
                footer = {
                    text = Config.DiscordLogFooter or "HW Development | Logs"
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }

        PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({username = Config.DiscordBotName or 'HW Development | Logs', embeds = embeds}), {['Content-Type'] = 'application/json'})
    end
end

-- Main event to buy items
RegisterServerEvent('hw_blackmarket:buyItem')
AddEventHandler('hw_blackmarket:buyItem', function (itemName, itemPrice, quantity)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerMoney = xPlayer.getMoney()
    local totalPrice = itemPrice * quantity

    Wait(20)

    if playerMoney >= totalPrice then 
        if xPlayer ~= nil then 
            xPlayer.removeMoney(totalPrice)
            xPlayer.addInventoryItem(itemName, quantity)
            if Config.Debug then
                print('^0[^1DEBUG^0] ^5Player ^3' .. src .. '^5 bought the following item(s) at the blackmarket ^3' .. quantity .. 'x ' .. itemName .. '^5 for ^3$' .. totalPrice .. "^5.")
            end            
            if Config.Logs then
            sendLog(src, string.format('Player **%s** bought **%s x%s** for $**%s** at the blackmarket', src, itemName, quantity, totalPrice))
            end
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = locale('notify_desc')})
    end
end)