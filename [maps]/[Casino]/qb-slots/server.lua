local QBCore = exports['qb-core']:GetCoreObject()
RegisterServerEvent("qb-slots:BetsAndChips")
AddEventHandler("qb-slots:BetsAndChips", function(bets)
    local _source   = source
    local xPlayer   = QBCore.Functions.GetPlayer(_source)
    if xPlayer then
        if bets % 50 == 0 and bets >= 50 then
            local playerChips = xPlayer.Functions.GetItemByName("casinochips")
            --print(playerChips)
            if playerChips ~= nil and playerChips.amount >= bets then
                TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['casinochips'], "remove")
                xPlayer.Functions.RemoveItem("casinochips", bets)
                TriggerClientEvent("qb-slots:UpdateSlots", _source, bets)
            else
                TriggerClientEvent('QBCore:Notify', _source, "Not enought chips")
            end
        else
            TriggerClientEvent('QBCore:Notify', _source, "You have to insert a multiple of 50. ex: 100, 350, 2500")
            
        end

    end
end)

RegisterServerEvent("qb-slots:PayOutRewards")
AddEventHandler("qb-slots:PayOutRewards", function(amount)
    local _source   = source
    local xPlayer   = QBCore.Functions.GetPlayer(_source)
    if xPlayer then
        amount = tonumber(amount)
        if amount > 0 then
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['casinochips'], "add")
            xPlayer.Functions.AddItem("casinochips", amount)
            TriggerClientEvent('QBCore:Notify', _source, "Slots: You won "..amount.." chips, not bad at all!")
        else
            TriggerClientEvent('QBCore:Notify', _source, "Slots: Unfortunately you've lost all your chips, maybe next time.")
        end
    end
end)