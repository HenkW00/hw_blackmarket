ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('hw_blackmarket:purchaseItem')
AddEventHandler('hw_blackmarket:purchaseItem', function(item, quantity, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, quantity)
        local message = string.format("Player: %s\nBought: %s\nQuantity: %d\nPrice: $%d", xPlayer.identifier, item, quantity, price)
        SendDiscordLog(message)
    else
        TriggerClientEvent('esx:showNotification', source, 'Not enough money')
    end
end)

function SendDiscordLog(message)
    local webhook = Config.DiscordWebhook
    if webhook ~= "" then
        local embeds = {
            {
                ["color"] = 3447003, -- Blue for general purchases
                ["title"] = "**Black Market Purchase**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "HW BlackMarket | Transactions Log",
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }

        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embeds}), { ['Content-Type'] = 'application/json' })
    else
        print("Discord webhook URL is not configured.")
    end
end
