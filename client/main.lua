ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- Citizen.CreateThread(function()
--     while ESX == nil do
--         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--         Citizen.Wait(0)
--     end
-- end)

Citizen.CreateThread(function()
        local pedInfo = Config.BlackMarketPed
        RequestModel(GetHashKey(pedInfo.model))
        while not HasModelLoaded(GetHashKey(pedInfo.model)) do
            Wait(1)
        end

        local ped = CreatePed(4, GetHashKey(pedInfo.model), pedInfo.coords.x, pedInfo.coords.y, pedInfo.coords.z, pedInfo.coords.w, false, true)
        SetEntityHeading(ped, pedInfo.coords.w)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        if pedInfo.animation.dict and pedInfo.animation.name then
            RequestAnimDict(pedInfo.animation.dict)
            while not HasAnimDictLoaded(pedInfo.animation.dict) do
                Wait(1)
            end
            TaskPlayAnim(ped, pedInfo.animation.dict, pedInfo.animation.name, 8.0, -8.0, -1, 1, 0, false, false, false)
        end

        while true do
            Wait(0)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - vector3(pedInfo.coords.x, pedInfo.coords.y, pedInfo.coords.z))

            if dist < 2.0 then
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to access the Black Market')
                if IsControlJustReleased(0, 38) then -- E key
                    OpenBlackMarketMenu()
                end
            end
        end
end)

function OpenBlackMarketMenu()
    ESX.UI.Menu.CloseAll()

    local elements = {}
    for _, categoryInfo in ipairs(Config.Categories) do
        if Config.Items[categoryInfo.value] then -- Check if there are items for this category
            table.insert(elements, {label = categoryInfo.label, value = categoryInfo.value})
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'black_market_categories', {
        title    = 'Black Market',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
        OpenCategoryMenu(data.current.value)
    end, function(data, menu)
        menu.close()
    end)
end

function OpenCategoryMenu(category)
    local elements = {}
    for _, item in ipairs(Config.Items[category]) do
        table.insert(elements, {label = item.label .. ' - $' .. item.price, value = item.item, price = item.price})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'black_market_items', {
        title    = 'Black Market - ' .. category,
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'black_market_buy_quantity', {
            title = 'Purchase Quantity'
        }, function(data2, menu2)
            local quantity = tonumber(data2.value)
            if quantity and quantity > 0 then
                TriggerServerEvent('hw_blackmarket:purchaseItem', data.current.value, quantity, data.current.price * quantity)
                menu2.close()
            else
                ESX.ShowNotification('Invalid quantity')
            end
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()
    end)
end

RegisterCommand('openblackmarket', function()
    if Config.Debug then
    OpenBlackMarketMenu()
    end
end, false)