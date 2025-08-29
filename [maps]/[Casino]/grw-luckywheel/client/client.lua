local QBCore = exports['qb-core']:GetCoreObject()
local _wheel = nil
local _wheelPos = vector3(1109.76, 227.89, -49.64)
local Keys = { ["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173 }
local _isRolling = false

-- load in the lucky wheel
Citizen.CreateThread(function()
	local model = GetHashKey('vw_prop_vw_luckywheel_02a')
	-- Wheel
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
	
	_wheel = CreateObject(model, 1111.05, 229.81, -50.38, false, false, true)
	SetEntityHeading(_wheel, 0.0)
	SetModelAsNoLongerNeeded(model)
end)

RegisterNetEvent("casino_luckywheel:doRoll")
AddEventHandler("casino_luckywheel:doRoll", function(_priceIndex) 
    _isRolling = true
    SetEntityHeading(_wheel, -30.0)
    SetEntityRotation(_wheel, 0.0, 0.0, 0.0, 1, true)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        -- local _priceIndex = math.random(1, 20)
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
            SetEntityRotation(_wheel, 0.0, _y, 0.0, 1, true)
            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent("casino_luckywheel:rollFinished")
AddEventHandler("casino_luckywheel:rollFinished", function() 
    _isRolling = false
end)

function doRoll()
    if not _isRolling then
        _isRolling = true
		TriggerServerEvent("casino_luckywheel:getLucky")
    end
end

Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = #(PlayerPos - vector3(1111.14, 227.69, -49.64))
            if dist < 10 then
                InRange = true
				
                DrawMarker(2, 1111.14, 227.69, -49.64, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 147, 230, 14, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist <= 1.0 then
                   
                    DrawText3Ds(1111.14, 227.69, -49.64 + 0.15, '[~g~E~w~] - Spin the Wheel')
                    if IsControlJustReleased(0, Keys['E']) then
						QBCore.Functions.TriggerCallback("grw-luckywheel:server:getbalance", function(balance)
						xPlayerTickets = balance
							if xPlayerTickets >= Config.SpinCost then
								TriggerServerEvent("grw-luckywheel:server:placebet", Config.SpinCost)
							else
								QBCore.Functions.Notify("You don't have enough Casino Tickets for the bet.", "error")
							end
						end)
					end
                end
            end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(0)
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end