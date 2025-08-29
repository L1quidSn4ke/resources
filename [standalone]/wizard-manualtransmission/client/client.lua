local wizardMileage = nil
local MileageStarted = false
local antiClutchLoop = false
local isManualMode = false
local currentGear = 1
local display = false
local ClutchHeld = false

local function DrawMissionText(msg, time)
    if not msg or not time then return end
    
    local soundId = GetSoundId()
    if soundId then
        PlaySoundFromCoord(soundId, "Enter_1st", Config.MusicCoords, "GTAO_FM_Events_Soundset", true, 5, true)
        ReleaseSoundId(soundId)
    end
    ClearPrints()
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandPrint(time, true)
end
local function ShowUI()
    if not display and Config.ShowUI and isManualMode then
        if not Config.UIloc then return end
        
        SendNUIMessage({
            type = 'setPosition',
            location = Config.UIloc,
            custom = Config.CustomUILoc or {top = 95, right = 46.7}
        })
        display = true
    end
end
local function HideUI()
    if display then
        SendNUIMessage({
            type = 'hideUI'
        })
        display = false
    end
end
local function UpdateGearDisplay(gear, rpm)
    if not Config.ShowUI then return end
    if not gear then return end
    
    local rpmThreshold = Config.RPMWarningThreshold or 0.8
    SendNUIMessage({
        type = 'updateGear',
        gear = gear,
        isOverRPM = rpm and rpm > rpmThreshold
    })
end

if Config.WizardMileage then
    Citizen.CreateThread(function()
        while true do
            if not MileageStarted then
                if GetResourceState("wizard-mileage") == "started" then
                    MileageStarted = true
                end
            end
            Wait(5000)
        end
    end)
end

-- Register the command to switch gearbox mode
RegisterCommand(Config.GearBoxMode, function()
    TriggerEvent("vehicleMileage:smartGearDetect", isManualMode)
    isManualMode = not isManualMode
    if not isManualMode then
        HideUI()
    end
    local message = isManualMode and 'Switched to manual transmission mode' or 'Switched to automatic transmission mode'
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0},
        args = {'Wizard Transmission', message}
    })
end, false)

local SET_VEHICLE_CURRENT_RPM_HASH = GetHashKey('SET_VEHICLE_CURRENT_RPM') & 0xFFFFFFFF
local SET_VEHICLE_CLUTCH_HASH = GetHashKey('SET_VEHICLE_CLUTCH') & 0xFFFFFFFF
Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        
        if IsPedInAnyVehicle(ped, false) and isManualMode then
            vehicle = GetVehiclePedIsIn(ped, false)
            
            -- Only proceed if vehicle is valid and the player is the driver
            if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
                ShowUI()
                
                -- Cache the rpm and maximum gears
                local rpm = GetVehicleCurrentRpm(vehicle)
                local maxGears = GetVehicleHandlingFloat(vehicle, "CHandlingData", "nInitialDriveGears")
                -- Gear shifting logic
                if IsControlJustPressed(0, Config.ShiftUp) then
                    if Config.ManualClutch and not IsControlPressed(0, Config.ClutchKey) then
                        TriggerEvent('chat:addMessage', {
                            color = {255, 0, 0},
                            args = {'Wizard Transmission', 'You need to hold clutch to change gears'}
                        })
                    elseif currentGear < maxGears then
                        if MileageStarted and not Config.ManualClutch then
                            TriggerEvent("vehicleMileage:updateClutchWT")
                        end
                        currentGear = currentGear + 1
                        UpdateGearDisplay(currentGear, rpm)
                        SetVehicleCurrentGear(vehicle, currentGear)
                        
                        if Config.SendChatText then
                            TriggerEvent('chat:addMessage', {
                                color = {255, 255, 0},
                                args = {'Wizard Transmission', 'Shifted up to gear ' .. currentGear}
                            })
                        end
                    end
                elseif IsControlJustPressed(0, Config.ShiftDown) then
                    if Config.ManualClutch and not IsControlPressed(0, Config.ClutchKey) then
                        TriggerEvent('chat:addMessage', {
                            color = {255, 0, 0},
                            args = {'Wizard Transmission', 'You need to hold clutch to change gears'}
                        })
                    elseif currentGear > 1 then
                        if MileageStarted and not Config.ManualClutch then
                            TriggerEvent("vehicleMileage:updateClutchWT")
                        end
                        currentGear = currentGear - 1
                        SetVehicleCurrentGear(vehicle, currentGear)

                        if Config.SendChatText then
                            TriggerEvent('chat:addMessage', {
                                color = {255, 255, 0},
                                args = {'Wizard Transmission', 'Shifted down to gear ' .. currentGear}
                            })
                        end
                    end
                end
                -- Handle revving when clutch is held
                if IsControlPressed(0, Config.ClutchKey) then
                    if MileageStarted and not antiClutchLoop then
                        TriggerEvent("vehicleMileage:updateClutchWT")
                        antiClutchLoop = true
                    end
                    -- Update rpm if necessary during clutch use
                    rpm = GetVehicleCurrentRpm(vehicle)
                    local accelInput = GetControlNormal(0, 71) -- 71 is for acceleration
                    if accelInput > 0 then
                        Citizen.InvokeNative(SET_VEHICLE_CLUTCH_HASH, vehicle, -1.0)
                        ClutchHeld = true
                    else
                        Citizen.InvokeNative(SET_VEHICLE_CLUTCH_HASH, vehicle, 1.0)
                        ClutchHeld = false
                    end
                else
                    antiClutchLoop = false
                    ClutchHeld = false
                    Citizen.InvokeNative(SET_VEHICLE_CLUTCH_HASH, vehicle, 1.0)
                end
                -- Cache gear and speed values to avoid multiple calls
                local currentVehicleGear = GetVehicleCurrentGear(vehicle)
                local wheelSpeed = GetVehicleDashboardSpeed(vehicle)
                local wheelSpeed2 = GetVehicleWheelSpeed(vehicle, 1)
                if wheelSpeed2 < -0.1 then 
                    UpdateGearDisplay('R', rpm)
                    currentGear = 1
                elseif wheelSpeed == 0 then 
                    UpdateGearDisplay('N', rpm)
                    currentGear = 1
                elseif wheelSpeed2 > 1 then
                    UpdateGearDisplay(currentGear, rpm)
                    SetVehicleCurrentGear(vehicle, currentGear)
                end
                Citizen.Wait(0)
            else
                HideUI()
                Citizen.Wait(500)
            end
        else
            if display then
                HideUI()
                display = false
            end
            if not IsPedInAnyVehicle(ped, false) then
                currentGear = 1
            end
            Citizen.Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        if ClutchHeld and Config.RpmCut then
            Citizen.InvokeNative(SET_VEHICLE_CURRENT_RPM_HASH, vehicle, Config.RpmCutMax)
            waitTime = Config.RpmCutTime
            Citizen.InvokeNative(SET_VEHICLE_CURRENT_RPM_HASH, vehicle, Config.RpmCutMin)
        else
            waitTime = 250
        end
        
        Wait(waitTime)
    end
end)