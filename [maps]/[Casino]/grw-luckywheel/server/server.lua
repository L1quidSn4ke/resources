local QBCore = exports['qb-core']:GetCoreObject()
isRoll = false

RegisterServerEvent("grw-luckywheel:server:payout")
AddEventHandler("grw-luckywheel:server:payout", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player ~= nil then
        Player.Functions.AddItem("lucky_ticket", amount)
        print("Added item")
    end
end)

RegisterServerEvent("grw-luckywheel:server:placebet")
AddEventHandler("grw-luckywheel:server:placebet", function(bet)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player ~= nil then
        Player.Functions.RemoveItem("lucky_ticket", bet)
		-- spin the wheel
		isRoll = true
		
        local _randomPrice = math.random(1,100) -- pick random number (1-20)
				
			if _randomPrice >= 1 and _randomPrice <= 10 then
			local _subRan = math.random(1,2)
			if _subRan == 1 then
				_priceIndex = 1 -- win
			else
				_priceIndex = 11 -- loose
			end
		
			elseif _randomPrice > 10 and _randomPrice <= 20 then
			local _subRan = math.random(1,2)
			if _subRan == 1 then
				_priceIndex = 2 -- win
			else
				_priceIndex = 11 -- loose
			end

			elseif _randomPrice > 20 and _randomPrice <= 30 then
			local _subRan = math.random(1,3)
			if _subRan == 1 then
				_priceIndex = 3 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 30 and _randomPrice <= 40 then
			local _subRan = math.random(1,4)
			if _subRan == 1 then
				_priceIndex = 4 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 40 and _randomPrice <= 50 then
			local _subRan = math.random(1,5)
			if _subRan == 1 then
				_priceIndex = 5 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 50 and _randomPrice <= 60 then
			local _subRan = math.random(1,6)
			if _subRan == 1 then
				_priceIndex = 6 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 60 and _randomPrice <= 70 then
			local _subRan = math.random(1,7)
			if _subRan == 1 then
				_priceIndex = 7 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 70 and _randomPrice <= 80 then
			local _subRan = math.random(1,8)
			if _subRan == 1 then
				_priceIndex = 8 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 80 and _randomPrice <= 90 then
			local _subRan = math.random(1,9)
			if _subRan == 1 then
				_priceIndex = 9 -- win
			else
				_priceIndex = 11 -- loose
			end
			
			elseif _randomPrice > 90 and _randomPrice <= 100 then
			local _subRan = math.random(1,10)
			if _subRan == 1 then
				_priceIndex = 10 -- win
			else
				_priceIndex = 11 -- loose
			end
		end
		
		-- prize index
		SetTimeout(Config.PrizeTimeOut, function()
		isRoll = false
			
			if _priceIndex == 1 then
				Player.Functions.AddItem(Config.PrizeIndex1_Item, Config.PrizeIndex1_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex1_Msg, 'success')
				
			elseif _priceIndex == 2 then
				Player.Functions.AddItem(Config.PrizeIndex2_Item, Config.PrizeIndex2_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex2_Msg, 'success')
				
			elseif _priceIndex == 3 then
				Player.Functions.AddItem(Config.PrizeIndex3_Item, Config.PrizeIndex3_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex3_Msg, 'success')
				
			elseif _priceIndex == 4 then
				Player.Functions.AddItem(Config.PrizeIndex4_Item, Config.PrizeIndex4_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex4_Msg, 'success')
				
			elseif _priceIndex == 5 then
				Player.Functions.AddItem(Config.PrizeIndex5_Item, Config.PrizeIndex5_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex5_Msg, 'success')
				
			elseif _priceIndex == 6 then
				Player.Functions.AddItem(Config.PrizeIndex6_Item, Config.PrizeIndex6_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex6_Msg, 'success')
				
			elseif _priceIndex == 7 then
				Player.Functions.AddItem(Config.PrizeIndex7_Item, Config.PrizeIndex7_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex7_Msg, 'success')
				
			elseif _priceIndex == 8 then
				Player.Functions.AddItem(Config.PrizeIndex8_Item, Config.PrizeIndex8_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex8_Msg, 'success')
				
			elseif _priceIndex == 9 then
				Player.Functions.AddItem(Config.PrizeIndex9_Item, Config.PrizeIndex9_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex9_Msg, 'success')
				
			elseif _priceIndex == 10 then
				Player.Functions.AddItem(Config.PrizeIndex10_Item, Config.PrizeIndex10_Amount)
				TriggerClientEvent('QBCore:Notify', src, Config.PrizeIndex10_Msg, 'success')

			elseif _priceIndex == 11 then
				TriggerClientEvent('QBCore:Notify', src, 'not a winner, please try again!', 'error')			
			end
			TriggerClientEvent("casino_luckywheel:rollFinished", -1)
		end)
		TriggerClientEvent("casino_luckywheel:doRoll", -1, _priceIndex)
    end
end)

QBCore.Functions.CreateCallback("grw-luckywheel:server:getbalance", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player ~= nil then
        tickets = Player.Functions.GetItemByName("lucky_ticket")
        if tickets ~= nil then
            cb(tickets.amount)
        else
            cb(0)
        end
    else
        cb(0)
    end
end)