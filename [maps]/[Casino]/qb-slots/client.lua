local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local open = false

Citizen.CreateThread(function()
	while QBCore.Functions.GetPlayerData().job == nil do
	  Citizen.Wait(1000)
	end
  
	QBCore.PlayerData = QBCore.Functions.GetPlayerData()
		Citizen.Wait(1000)
  end)
  
  RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
  AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
	QBCore.PlayerData = xPlayer
  end)

-------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------
local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

-------------------------------------------------------------------------------
-- NET EVENTS
-------------------------------------------------------------------------------
RegisterNetEvent("qb-slots:enterBets")
AddEventHandler("qb-slots:enterBets", function ()
	local requiredItems = {
		[1] = {name = QBCore.Shared.Items["casinochips"]["name"], image = QBCore.Shared.Items["casinochips"]["image"]},
	}
	TriggerEvent('inventory:client:requiredItems', requiredItems, true)
	TriggerEvent('QBCore:Notify', 'How many chips you wanna bet? (Only 50 on 50 values.)', 'success')
    	local bets = KeyboardInput("Enter bet value:", "", Config.MaxBetNumbers)
    	if tonumber(bets) ~= nil then
    		TriggerServerEvent('qb-slots:BetsAndChips', tonumber(bets))
		TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    	else
		TriggerEvent('QBCore:Notify', 'You need to enter numbers (9999 is max bet).')
      		TriggerEvent('inventory:client:requiredItems', requiredItems, false)
    	end
end)

RegisterNetEvent("qb-slots:UpdateSlots")
AddEventHandler("qb-slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	TriggerEvent('inventory:client:requiredItems', requiredItems, false)
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

-------------------------------------------------------------------------------
-- NUI CALLBACKS
-------------------------------------------------------------------------------
RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerEvent('inventory:client:requiredItems', requiredItems, false)
	TriggerServerEvent("qb-slots:PayOutRewards", data.coinAmount)
end)

-------------------------------------------------------------------------------
-- BT TARGET THREAD
-------------------------------------------------------------------------------
Citizen.CreateThread(function()

local slot_models = { -- SLOT PROPS
    `ch_prop_casino_slot_01a`,
    `ch_prop_casino_slot_02a`,
    `ch_prop_casino_slot_03a`,
    `ch_prop_casino_slot_04a`,
    `ch_prop_casino_slot_04b`,
    `ch_prop_casino_slot_05a`,
    `ch_prop_casino_slot_06a`,
    `ch_prop_casino_slot_07a`,
    `ch_prop_casino_slot_08a`,
    `vw_prop_casino_slot_01a`,
    `vw_prop_casino_slot_02a`,
    `vw_prop_casino_slot_03a`,
    `vw_prop_casino_slot_04a`,
    `vw_prop_casino_slot_05a`,
    `vw_prop_casino_slot_06a`,
    `vw_prop_casino_slot_07a`,
    `vw_prop_casino_slot_08a`,
    }
    exports['qb-target']:AddTargetModel(slot_models, {
        options = {
            {
                event = "qb-slots:enterBets",
                icon = "fas fa-coins",
                label = "Play Slots"
            },
        },
        distance = 3.0
    })

end)
