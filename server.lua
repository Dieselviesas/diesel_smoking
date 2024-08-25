ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('diesel:unpackCigarettes')
AddEventHandler('diesel:unpackCigarettes', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        -- I�imti cigareciu pakeli i� inventoriaus
        
            -- Prideti 20 cigareciu i �aidejo inventoriu
            --xPlayer.addInventoryItem('cigarette', 20)
            local playerId = xPlayer.source
            local inv = playerId
            exports.ox_inventory:RemoveItem(inv, "cigs_redwood", "1")
            exports.ox_inventory:AddItem(inv, 'cigs', "20")
            --TriggerClientEvent('ox_inventory:notify', source, 'Cigarečių pakelis', 'Išpakavote cigarečių pakelį.', 'success')

    end
end)

RegisterNetEvent('diesel:smokecig')
AddEventHandler('diesel:smokecig', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local playerId = xPlayer.source
        local inv = playerId
        exports.ox_inventory:RemoveItem(inv, "cigs", "1")
    end
end)

RegisterNetEvent('diesel:vapinti')
AddEventHandler('diesel:vapinti', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local _source = source
    local skystis = exports.ox_inventory:GetItemCount(_source, 'vape_juce')
    if xPlayer then
        local playerId = xPlayer.source
        local inv = playerId
        if skystis > 0 then
            exports.ox_inventory:RemoveItem(inv, "vape_juce", "1")
            TriggerClientEvent('diesel:vape', source)
        else
            TriggerClientEvent('ox_lib:notify', _source, { type = 'error', position = 'center-right', description = 'Jūs neturite skysčio savo El. cigaretei'})
        end
    end
end)