-- █████╗ ██████╗ ███████╗██╗  ██╗    ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ ███████╗
--██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝    ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗██╔════╝
--███████║██████╔╝█████╗   ╚███╔╝     ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║███████╗
--██╔══██║██╔═══╝ ██╔══╝   ██╔██╗     ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║╚════██║
--██║  ██║██║     ███████╗██╔╝ ██╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝███████║
--╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ ╚══════╝

----------------------------------------------------------------------------------------------------

ApexConfig = {}
ApexConfig.Debug = true

-- FRAMEWORKS + RESOURCE NAMES
-------------------------------------
--[[- FRAMEWORK: (qbcore, esx)
    - qbcore
    - esx
]]--
--[[- RESOURCE NAME: (qb-core, es_extended)
    - qb-core
    - es_extended
]]--
ApexConfig.Framework = 'qbcore'
ApexConfig.ResourceName = 'qb-core'
-------------------------------------

-- BOSSMENU SYSTEMS
-------------------------------------
--[[
    - qb-bossmenu:client:OpenMenu
    - esx_society:openBossMenu
    - xboss:OpenMenu
]]--
ApexConfig.Bossmenu = 'qb-bossmenu:client:OpenMenu'
-------------------------------------

-- GANGMENU SYSTEMS
-------------------------------------
--[[
    - qb-gangmenu:client:OpenMenu
    - esx_society:openBossMenu
]]--
ApexConfig.Gangmenu = 'qb-gangmenu:client:OpenMenu'
-------------------------------------

-- TARGET SYSTEMS
-------------------------------------
--[[
    - qb-target
    - ox_target
    - qtarget
]]--
ApexConfig.Target = 'qb-target'
-------------------------------------

-- MENU SYSTEMS
-------------------------------------
--[[
    - qb-menu
    - ox_lib
]]--
ApexConfig.Menu = 'ox_lib'
-------------------------------------

-- INPUT SYSTEMS
-------------------------------------
--[[
    - qb-input
    - ox_lib
]]--
ApexConfig.Input = 'ox_lib'
-------------------------------------


-- INVENTORY SYSTEMS
-------------------------------------
--[[
    - qb-inventory (Old Version)
    - qb-inventoryv2 (New Version)
    - lj-inventory
    - ps-inventory
    - qs-inventory
    - ox_inventory
    - codem-inventory
    - origen_inventory
    - tgiann-inventory
    - core_inventory
]]--
ApexConfig.Inventory = 'ps-inventory'
-------------------------------------

-- PROGRESSBAR SYSTEMS
-------------------------------------
--[[
    - qbcore
    - ox_lib
    - progressBars
]]--
ApexConfig.Progressbar = 'qbcore'
-------------------------------------

-- NOTIFICATION SYSTEMS
-------------------------------------
--[[
    - apex_lib
    - qbcore
    - esx
    - okok
    - codem
    - mythic
    - tgiann
    - ps (project sloth)
    - ox_lib
]]--
ApexConfig.Notification = 'qbcore'
-------------------------------------

-- PAYMENT SYSTEMS
-------------------------------------
--[[
    - jim-payments
    - okokBilling
    - tgg-billing
    - s1n_billing
]]--
ApexConfig.Payment = 'jim-payments'
-------------------------------------

-- CLOTHING SYSTEMS
-------------------------------------
--[[
    - qb-clothing
    - illenium-appearance
    - crm-appearance
    - bl_appearance
    - rcore_clothes
    - esx_skin
    - tgiann-clothing
]]--
ApexConfig.Clothing = 'illenium-appearance'
-------------------------------------


-- MDT SYSTEMS
-------------------------------------
--[[
    - ps-mdt
    - al_mdt
    - qs-mdt
    - redutzu-mdt
    - lb-tablet
]]--
ApexConfig.MDT = 'ps-mdt'
-------------------------------------


-- DISPATCH SYSTEMS
-------------------------------------
--[[
    - qbcore
    - ps-dispatch
    - qs-dispatch
    - cd_dispatch
    - core_dispatch
]]--
ApexConfig.Dispatch = 'ps-dispatch'
-------------------------------------


-- PHONE SYSTEMS
-------------------------------------
--[[
    - qb-phone
    - qs-smartphone
    - gksphone
    - lb-phone
    - yseries
]]--
ApexConfig.Phone = 'jpr-phone'
-------------------------------------


-- FUEL SYSTEMS
-------------------------------------
--[[
    - LegacyFuel
    - esx-sna-fuel
    - ps-fuel
    - lj-fuel
    - cdn-fuel
    - qs-fuelstations
    - frkn-fuelstation
    - okokGasStation
    - ti_fuel
    - cc-fuel
    - ox_fuel
    - ND_Fuel
    - FRFuel
    - x-fuel
    - rcore_fuel
    - tam_fuel
    - renewed-fuel
    - bigdaddy-fuel
    - lc_fuel
    - fast-fuel
]]--
ApexConfig.Fuel = 'lc_fuel'
-------------------------------------


-- GARAGE SYSTEMS
-------------------------------------
--[[
    - qb-garage
    - cd_garage
    - jg-advancedgarages
    - qs-advancedgarages
]]--
ApexConfig.Garage = 'cd_garage'
-------------------------------------


-- PRISON SYSTEMS
-------------------------------------
--[[
    - qb-prison
    - lionheart-jail
    - rcore_prison
    - astudios-penitentiary (If this is being use, remember to set Jailing to false in the apex_lawenforcement config)
]]--
ApexConfig.Jail = 'qb-prison'
-------------------------------------


-- VEHICLE LOCKSYSTEM SYSTEMS
-------------------------------------
--[[
    - qb-vehiclekeys
    - qs-vehiclekeys
    - wasabi_carlock
    - jaksam-vehiclekeys
    - F_RealCarKeysSystem
    - fivecode_carkeys
    - stasiek_vehiclekeys
    - t1ger_keys
    - ti_vehicleKeys
    - vehicles_keys
    - xd_locksystem
    - MrNewbVehicleKeys
    - tgiann-hotwire
]]--
ApexConfig.Keylock = 'qb-vehiclekeys'
-------------------------------------


-- TEXT UI SYSTEMS
-------------------------------------
--[[
    - apex_lib
    - qbcore
    - qbx
    - ox_lib
    - ps (project sloth)
]]--
ApexConfig.TextUI = 'apex_lib'
-------------------------------------


-- BUILT-IN FEATURES [PARTIALLY IN DEVELOPMENT]
-------------------------------------
--[[
    - If chat is set to true - Please remove any other chat resource from your server
    - Failure to do so will result in chat conflicts
]]--
ApexConfig.Chat = false

--[[
    - To use our overlay chat (me, med, ool as 3d text), set the settings below to true
    - Don't wanna use them, set them to false
    - Remember to disable the /me command in qbcore if using this!
]]--
ApexConfig.OverlayChat = {              -- Also know as 3D Chat
    me = true,                          -- Default me chat
    med = true,                         -- Special me chat for ems (Could be used to let people know the ems is enroute to the call, etc.)
    ool = true,                         -- Out of character chat locally
    position = {                        -- Don't touch anything inside this, if you don't know what you're doing!
        coordsX = 0,                    -- Move text left or right
        coordsY = 0,                    -- Move text forward or backward
        coordsZ = 1.1                   -- Move text up or down
    },
    Webhook = 'WEBHOOK_HERE',           -- Discord webhook for logging
}
-------------------------------------


-- RESOURCE INFORMATION
-------------------------------------
--[[
    When using this resource, you are not always going to use all the features.
    So keep in mind, that you do not have to set everything. Some features might only be for a few scripts, where others are for everyone.
]]--