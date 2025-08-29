Config = {}

Config.ShowUI = true                                 -- Enable/disable gear display UI
Config.UIloc = "custom"                              -- top-right, top-left, custom
Config.CustomUILoc = {top = 95, right = 46.7}        -- Only used if UI location is set to custom (values in %)

Config.GearBoxMode = "gearboxmode"                   -- Command to choose between manual and automatic gearbox mode

Config.WizardMileage = false                          -- Enable hook for wizard mileage script (https://forum.fivem.net/t/release-wizard-mileage/106698)

Config.ManualClutch = false                          -- Player must use clutch to change gears

Config.RpmCut = true                                 -- Enable Rpm Cut system
Config.RpmCutTime = 130                              -- Rpm cut limit timer, lower = more beautiful sound (110 - 200)
Config.RpmCutMax = 1.0                               -- The maximum rpm when using Rpm Cut timer (0.0 - 1.0)
Config.RpmCutMin = 0.8                               -- The minimum rpm when using Rpm Cut timer (0.0 - 1.0)


Config.SendChatText = false                          -- Send chat text when changing gears

Config.ShiftUp = ""
Config.ShiftDown = ""
Config.ClutchKey = ""