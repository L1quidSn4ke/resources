Config = {}
Config.Debug = false

Config.oxInv = false -- set this to ox if you have ox_inventory

--  DISABLE OX LIB IN FXMANIFEST IF THIS IS FALSE:
Config.oxLib = true -- set this to ox if you have ox_lib !!! MAKE SURE OX LIB IS ADDED TO SHARED_SCRIPTS IN FXMANIFEST!!
Config.useOxTarget = false -- Set to true if you use ox-target. If this is false the script uses qb target

Config.UseLocalImages = false -- set this to true if you want to use local images rather than automatic. Put the images for the recipes and ingredients in the 'images' folder next to the blueprint.png
Config.ReopenCraftingWhenFinished = true -- if true the script will re-open the crafting when it's done

Config.ItemName = "cw_blueprint" -- Name of the item in your items.lua
Config.PlayersTableName = 'players' -- 'players' for qb/qbox, 'characters' for ox. Something else for esx probably
Config.PlayerDbIdentifier = 'citizenId' -- 'citizenId' for qb/qbox, 'stateId' for ox, Something else for ex probably
Config.UseCWRepForCraftingSkill = false -- Set to true if you want to use cw-rep for skill instead of qbs metadata
-- The following all require cw-rep to be enabled:
Config.CraftingSkillName = 'crafting' -- Make sure this matches the crafting skill name in your cw-rep config
Config.CraftingSkillLabel = '"Crafting Skill"' -- Default name for the crafting skill
Config.UseLevelsInsteadOfSkill = false -- If true then cw-rep will use level instead of pure xp
Config.DefaultMaxCraft = 10 -- Default max amount a player can craft at a time

Config.PrimaryUiColor = '#52d996' -- Primary color in UI, default is blue

local minimumSkillRep = 1 -- the least amount of skill you can gain per craft

-- You can tweak this function to return different amount of points per skill
-- The default one will give you 1 skill for a crafted item and the +1 for each 100 in skill requirement the item has.
Config.CraftingRepGainFunction = function(skillReq, recipe)
    if recipe and recipe.customSkillGain then return recipe.customSkillGain end
    if not skillReq then return minimumSkillRep end

    local skillGain = 1 + math.floor((skillReq - 1) / 100)
    if skillGain < minimumSkillRep then return minimumSkillRep end
    if Config.Debug then print('Skill gain:', skillGain) end
    return skillGain
end

Config.Blueprints = {-- rarity is 1-5, chance is 0.0-1.0 with lower numbers lowering chance of getting the item

--BASIC
    ["weapon_crowbar"]             = { label = "Crowbar",                 rarity = 1,  chance = 0.1,  type = 'basic'          },
    ["weapon_hatchet"]             = { label = "Hatchet",                 rarity = 1,  chance = 0.1,  type = 'basic'          },
    ["weapon_knife"]               = { label = "Knife",                   rarity = 1,  chance = 0.1,  type = 'basic'          },
    ["weapon_machete"]             = { label = "Machete",                 rarity = 1,  chance = 0.1,  type = 'basic'          },

--AMMO BLUEPRINTS
    ['pistol_ammo']                = { label = "Pistol ammo",             rarity = 2,  chance = 0.1,  type = 'ammo'           },
    ['rifle_ammo']                 = { label = "Rifle ammo",              rarity = 3,  chance = 0.3,  type = 'ammo'           },
    ['smg_ammo']                   = { label = "SMG ammo",                rarity = 3,  chance = 0.2,  type = 'ammo'           },
    ['shotgun_ammo']               = { label = "Shotgun ammo",            rarity = 3,  chance = 0.2,  type = 'ammo'           },
    ['snp_ammo']                   = { label = "Sniper ammo",             rarity = 4,  chance = 0.2,  type = 'ammo'           },

--ILLEGAL BLUEPRINTS
    ['aluminumoxide']              = { label = "Aluminum Oxide",          rarity = 3,  chance = 0.3,  type = 'illegal'        },
    ['armor']                      = { label = "Armor",                   rarity = 5,  chance = 0.5,  type = 'illegal'        },
    ['advancedlockpick']           = { label = "Advanced Lockpick",       rarity = 3,  chance = 0.4,  type = 'illegal'        },
    ['drill']                      = { label = "Drill",                   rarity = 3,  chance = 0.5,  type = 'illegal'        },
    ['heavyarmor']                 = { label = "Heavy Armor",             rarity = 5,  chance = 0.7,  type = 'illegal'        },
    ["suppressor_attachment"]      = { label = "Suppressor",              rarity = 3,  chance = 0.7,  type = 'illegal'        },
    ["drum_attachment"]            = { label = "Drum",                    rarity = 4,  chance = 0.6,  type = 'illegal'        },
    ["weapon_molotov"]             = { label = "Molotov",                 rarity = 4,  chance = 0.7,  type = 'illegal'        },
    ["weapon_pipebomb"]            = { label = "Pipebomb",                rarity = 4,  chance = 0.7,  type = 'illegal'        },
    ["weapon_knuckle"]             = { label = "Knuckle",                 rarity = 1,  chance = 0.1,  type = 'illegal'        },
    ["largescope_attachment"]      = { label = "Large Scope",             rarity = 2,  chance = 0.5,  type = 'illgeal'        },
    ["advscope_attachment"]        = { label = "Advanced Scope",          rarity = 3,  chance = 0.3,  type = 'illegal'        },
    ["thermalscope_attachment"]    = { label = "Thermal Scope",           rarity = 3,  chance = 0.3,  type = 'Illegal'        },

--ELECTRONICS BLUEPRINTS
    ['electronickit']              = { label = "Electronic Kit",          rarity = 2,  chance = 0.2,  type = 'electronics'    },
    ['radioscanner']               = { label = "Radio Scanner",           rarity = 2,  chance = 0.2,  type = 'electronics'    },
    ['gatecrack']                  = { label = "Gatecrack",               rarity = 4,  chance = 0.5,  type = 'electronics'    },
    ['trojan_usb']                 = { label = "Trojan USB",              rarity = 3,  chance = 0.2,  type = 'electronics'    },

-- GUNSMITH BLUEPRINTS
    ["weapon_marksmanpistol"]      = { label = "Marksman Pistol",         rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_pumpshotgun"]         = { label = "Pump Shotgun",            rarity = 3,  chance = 0.4,  type = 'guns'           },
    ["weapon_sniperrifle"]         = { label = "Sniper Rifle",            rarity = 4,  chance = 0.7,  type = 'guns'           },
    ["weapon_marksmanrifle"]       = { label = "Marksman Rifle",          rarity = 4,  chance = 0.7,  type = 'guns'           },
    ["weapon_pistol_mk2"]          = { label = "Pistol Mk II",            rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_combatpistol"]        = { label = "Combat Pistol",           rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_pistol50"]            = { label = "Pistol .50",              rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_heavypistol"]         = { label = "Heavy Pistol",            rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_revolver"]            = { label = "Revolver",                rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_revolver_mk2"]        = { label = "Violence",                rarity = 3,  chance = 0.4,  type = 'guns'           },
    ["weapon_doubleaction"]        = { label = "Double Action Revolver",  rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_navyrevolver"]        = { label = "Navy Revolver",           rarity = 2,  chance = 0.3,  type = 'guns'           },
    ["weapon_heavyshotgun"]        = { label = "Heavy Shotgun",           rarity = 3,  chance = 0.5,  type = 'guns'           },
    ["weapon_dbshotgun"]           = { label = "Double-barrel Shotgun",   rarity = 3,  chance = 0.5,  type = 'guns'           },
    ["weapon_pumpshotgun_mk2"]     = { label = "Pumpshotgun Mk II",       rarity = 3,  chance = 0.6,  type = 'guns'           },
    ["weapon_marksmanrifle_mk2"]   = { label = "Marksman Rifle Mk II",    rarity = 4,  chance = 0.7,  type = 'guns'           },
    ["weapon_microsmg"]            = { label = "Micro SMG",               rarity = 3,  chance = 0.5,  type = 'guns'           },
    ["weapon_machinepistol"]       = { label = "Tec-9",                   rarity = 3,  chance = 0.5,  type = 'guns'           },
    ["weapon_sawnoffshotgun"]      = { label = "Sawn-off Shotgun",        rarity = 3,  chance = 0.6,  type = 'guns'           },
    ["weapon_assaultrifle"]        = { label = "Assault Rifle",           rarity = 5,  chance = 0.8,  type = 'guns'           },
    ["weapon_compactrifle"]        = { label = "Compact Rifle",           rarity = 5,  chance = 0.8,  type = 'guns'           },
    ["weapon_carbinerifle"]        = { label = "Carbine Rifle",           rarity = 5,  chance = 0.8,  type = 'guns'           },
    ["weapon_mg"]                  = { label = "Machinegun",              rarity = 5,  chance = 0.9,  type = 'guns'           },
    ["weapon_gusenberg"]           = { label = "Thompson SMG",            rarity = 5,  chance = 0.7,  type = 'guns'           },
    ['weapon_appistol']            = { label = "AP Pistol",               rarity = 5,  chance = 0.7,  type = 'guns'           },
    ["clip_attachment"]            = { label = "Clip",                    rarity = 1,  chance = 0.2,  type = 'guns'           },
    ["flashlight_attachment"]      = { label = "Flashlight",              rarity = 1,  chance = 0.2,  type = 'guns'           },
    ["grip_attachment"]            = { label = "Grip",                    rarity = 1,  chance = 0.2,  type = 'guns'           },
    ["holoscope_attachment"]       = { label = "Holo Scope",              rarity = 1,  chance = 0.3,  type = 'guns'           },
    ["smallscope_attachment"]      = { label = "Small Scope",             rarity = 1,  chance = 0.2,  type = 'guns'           },
    ["medscope_attachment"]        = { label = "Medium Scope",            rarity = 2,  chance = 0.3,  type = 'guns'           },

-- WEAPON PART BLUEPRINTS
    ['weapon_trigger_pistol']      = { label = "Pistol Trigger",          rarity = 5,  chance = 0.1,  type = 'trigger'        },
    ['weapon_trigger_rifle']       = { label = "Rifle Trigger",           rarity = 5,  chance = 0.1,  type = 'trigger'        },
    ['weapon_trigger_shotgun']     = { label = "Shotgun Trigger",         rarity = 5,  chance = 0.1,  type = 'trigger'        },
    ['weapon_trigger_smg']         = { label = "SMG Trigger",             rarity = 5,  chance = 0.1,  type = 'trigger'        },
    ['weapon_trigger_sniper']      = { label = "Sniper Trigger",          rarity = 5,  chance = 0.1,  type = 'trigger'        },
    ['weapon_trigger_lmg']         = { label = "LMG Trigger",             rarity = 5,  chance = 0.1,  type = 'trigger'        },
    ['weapon_barrel_pistol']       = { label = "Pistol Barrel",           rarity = 5,  chance = 0.1,  type = 'barrel'         },
    ['weapon_barrel_rifle']        = { label = "Rifle Barrel",            rarity = 5,  chance = 0.1,  type = 'barrel'         },
    ['weapon_barrel_shotgun']      = { label = "Shotgun Barrel",          rarity = 5,  chance = 0.1,  type = 'barrel'         },
    ['weapon_barrel_smg']          = { label = "SMG Barrel",              rarity = 5,  chance = 0.1,  type = 'barrel'         },
    ['weapon_barrel_sniper']       = { label = "Sniper Barrel",           rarity = 5,  chance = 0.1,  type = 'barrel'         },
    ['weapon_barrel_lmg']          = { label = "LMG Barrel",              rarity = 5,  chance = 0.1,  type = 'barrel'         },
    ['weapon_upper_pistol']        = { label = "Pistol Upper",            rarity = 5,  chance = 0.1,  type = 'upper'          },
    ['weapon_upper_rifle']         = { label = "Rifle Upper",             rarity = 5,  chance = 0.1,  type = 'upper'          },
    ['weapon_frame_shotgun']       = { label = "Shotgun Frame",           rarity = 5,  chance = 0.1,  type = 'upper'          },
    ['weapon_upper_smg']           = { label = "SMG Upper",               rarity = 5,  chance = 0.1,  type = 'upper'          },
    ['weapon_upper_sniper']        = { label = "Sniper Upper",            rarity = 5,  chance = 0.1,  type = 'upper'          },
    ['weapon_upper_lmg']           = { label = "LMG Upper",               rarity = 5,  chance = 0.1,  type = 'upper'          },
    ['weapon_lower_pistol']        = { label = "Pistol Lower",            rarity = 5,  chance = 0.1,  type = 'lower'          },
    ['weapon_lower_rifle']         = { label = "Rifle Lower",             rarity = 5,  chance = 0.1,  type = 'lower'          },
    ['weapon_lower_smg']           = { label = "SMG Lower",               rarity = 5,  chance = 0.1,  type = 'lower'          },
    ['weapon_lower_sniper']        = { label = "Sniper Lower",            rarity = 5,  chance = 0.1,  type = 'lower'          },
    ['weapon_buttstock_lmg']       = { label = "LMG Lower",               rarity = 5,  chance = 0.1,  type = 'lower'          },

}

Config.DefaultFailChance = 0.05

Config.DefaultCraftingTime = 1000 -- in milliseconds
Config.LearningTime = 5000 -- time it takes to learn BP in milliseconds

Config.Recipes = {
    -- Misc Items
    ['lockpick'] = {
        category = "Tools",
        toItems = {
            lockpick = 2,
        },
        materials = {["metalscrap"] = 4, ["plastic"] = 4},
        craftingTime = 1000,
        craftingSkill = 0,
        customSkillGain = .5,
        tables = {'basic'},
    },
    ['advancedlockpick'] = {
        category = "Tools",
        toItems = {
            advancedlockpick = 1,
        },
        materials = {["metalscrap"] = 10, ["plastic"] = 10},
        craftingTime = 5000,
        craftingSkill = 5,
        customSkillGain = 1,
        tables = {'illegal'},
        blueprint = 'advancedlockpick',
    },
    ['gatecrack'] = {
        category = "Tools",
        toItems = {
            gatecrack = 1,
        },
        materials = {["metalscrap"] = 40, ["plastic"] = 50},
        craftingTime = 10000,
        craftingSkill = 75,
        customSkillGain = 5,
        tables = {'electronics'},
        blueprint = 'gatecrack',
    },
    ['trojan_usb'] = {
        category = "Tools",
        toItems = {
            trojan_usb = 1,
        },
        materials = {["metalscrap"] = 25, ["plastic"] = 30},
        craftingTime = 10000,
        craftingSkill = 60,
        customSkillGain = 5,
        tables = {'electronics'},
        blueprint = 'trojan_usb',
    },
    ['drill'] = {
        category = "Tools",
        toItems = {
            drill = 1,
        },
        materials = {["metalscrap"] = 150, ["plastic"] = 75},
        craftingTime = 10000,
        craftingSkill = 200,
        customSkillGain = 3,
        tables = {'illegal'},
		blueprint = {'drill'},
    },
    ['radioscanner'] = {
        category = "Tools",
        toItems = {
            radioscanner = 1,
        },
        materials = {["metalscrap"] = 30, ["plastic"] = 25, ["electronickit"] = 5},
        craftingTime = 10000,
        craftingSkill = 600,
        customSkillGain = 5,
        tables = {'electronics'},
        blueprint = 'radioscanner',
    },
    ['heavyarmor'] = {
        category = "Tools",
        toItems = {
            heavyarmor = 1,
        },
        materials = {["metalscrap"] = 550, ["steel"] = 250},
        craftingTime = 10000,
        craftingSkill = 150,
        customSkillGain = 5,
        tables = {'illegal'},
        blueprint = 'heavyarmor',
    },
    ['armor'] = {
        category = "Tools",
        toItems = {
            armor = 1,
        },
        materials = {["metalscrap"] = 350, ["steel"] = 200},
        craftingTime = 10000,
        craftingSkill = 50,
        customSkillGain = 5,
        tables = {'illegal'},
        blueprint = 'armor',
    },
    ['repairkit'] = {
        category = "Tools",
        toItems = {
            repairkit = 1,
        },
        materials = {["metalscrap"] = 100, ["plastic"] = 75},
        craftingTime = 5000,
        craftingSkill = 100,
        customSkillGain = .5,
        tables = {'basic'},
		blueprint = 'repairkit',
    },
    ['electronickit'] = {
        category = "Tools",
        toItems = {
            electronickit = 1,
        },
        materials = {["metalscrap"] = 15, ["aluminum"] = 25},
        craftingTime = 2000,
        craftingSkill = 30,
        customSkillGain = 1,
        tables = {'electronics'},
		blueprint = 'electronickit',
    },
    ['aluminumoxide'] = {
        category = "Tools",
        toItems = {
            aluminumoxide = 1,
        },
        materials = {["aluminum"] = 75},
        craftingTime = 2000,
        craftingSkill = 45,
        customSkillGain = 2,
        tables = {'basic'},
        blueprint = 'aluminumoxide',
    },
    ["weapon_crowbar"] = {
        label = "Crowbar",
        toItems = {
            weapon_crowbar = 1,
        },
        materials = {
            ["metalscrap"] = 250,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'basic'},
        craftingSkill = 15,
		customSkillGain = 1,
    },
    ["weapon_hatchet"] = {
        label = "Hatchet",
        toItems = {
            weapon_hatchet = 1,
        },
        materials = {
            ["metalscrap"] = 250, ["rubber"] = 75, ["iron"] = 250,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'basic'},
        craftingSkill = 50,
        customSkillGain = 5,
    },
    ["weapon_knuckle"] = {
        label = "Knuckle",
        toItems = {
            weapon_knuckle = 1,
        },
        materials = {
            ["metalscrap"] = 250,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'illegal'},
        craftingSkill = 100,
        customSkillGain = 2,
        blueprint = 'weapon_knuckle',
    },
    ["weapon_knife"] = {
        label = "Knife",
        toItems = {
            weapon_knife = 1,
        },
        materials = {
            ["steel"] = 250, ["plastic"] = 75, ["rubber"] = 75,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'basic'},
        craftingSkill = 40,
        customSkillGain = 3,
    },
    ["weapon_machete"] = {
        label = "Machete",
        toItems = {
            weapon_machete = 1,
        },
        materials = {
            ["steel"] = 250, ["plastic"] = 100, ["rubber"] = 75,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'basic'},
        craftingSkill = 75,
        customSkillGain = 3,
    },
    -- Ammo
    ['pistol_ammo'] = {
        category = "Ammo",
        toItems = {
            pistol_ammo = 1,
        },
        materials = {["metalscrap"] = 5, ["steel"] = 5},
        craftingTime = 2000,
        craftingSkill = 0,
        customSkillGain = 2,
        tables = {'ammo'},
        bluepint = 'pistol_ammo'
    },
    ['rifle_ammo'] = {
        category = "Ammo",
        toItems = {
            rifle_ammo = 1,
        },
        materials = {["metalscrap"] = 10, ["steel"] = 10},
        craftingTime = 2000,
        craftingSkill = 35,
        customSkillGain = 52,
        tables = {'ammo'},
        blueprint = 'rifle_ammo',
        },
    ['smg_ammo'] = {
        category = "Ammo",
        toItems = {
            smg_ammo = 1,
        },
        materials = {["metalscrap"] = 20, ["steel"] = 15},
        craftingTime = 2000,
        craftingSkill = 80,
        customSkillGain = 2,
        tables = {'ammo'},
        blueprint = 'smg_ammo',
    },
    ['shotgun_ammo'] = {
        category = "Ammo",
        toItems = {
            shotgun_ammo = 1,
        },
        materials = {["metalscrap"] = 10, ["plastic"] = 10, ["steel"] = 10},
        craftingTime = 2000,
        craftingSkill = 0,
        customSkillGain = 2,
        tables = {'ammo'},
        blueprint = 'shotgun_ammo'
    },
    ['snp_ammo'] = {
        category = "Ammo",
        toItems = {
            snp_ammo = 1,
        },
        materials = {["metalscrap"] = 75, ["iron"] = 50, ["steel"] = 50},
        craftingTime = 2000,
        craftingSkill = 175,
        customSkillGain = 5,
        tables = {'ammo'},
        blueprint = 'snp_ammo',
    },
   -- Pistols
    ["weapon_appistol"] = {
        label = "AP Pistol",
        toItems = {
            weapon_appistol = 1,
        },
        materials = {['weapon_trigger_pistol'] = 1,['weapon_barrel_pistol'] = 1, ['weapon_upper_pistol'] = 1, ['weapon_lower_pistol'] = 1, ['rubber'] = 10, ['plastic'] = 5,},
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 350,
		customSkillGain = 2,
        blueprint = 'weapon_appistol',
        metadata = {serial = true}
    },
    ["weapon_marksmanpistol"] = {
        label = "Marksman Pistol",
        toItems = {
            weapon_marksmanpistol = 1,
        },
        materials = {['weapon_trigger_pistol'] = 1,['weapon_barrel_pistol'] = 1, ['weapon_upper_pistol'] = 1, ['weapon_lower_pistol'] = 1, ['rubber'] = 10, ['plastic'] = 5,},
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 200,
		customSkillGain = 5,
        blueprint = 'weapon_marksmanpistol',
        metadata = {serial = true}
    },
    ["weapon_pistol_mk2"] = {
        label = "Pistol Mk2",
        toItems = {
            weapon_pistol_mk2 = 1,
        },
        materials = {['weapon_trigger_pistol'] = 1,['weapon_barrel_pistol'] = 1, ['weapon_upper_pistol'] = 1, ['weapon_lower_pistol'] = 1, ['rubber'] = 10, ['plastic'] = 5,},
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 200,
        customSkillGain = 2,
        blueprint = 'weapon_pistol_mk2',
        metadata = {serial = true}
    },
    ["weapon_combatpistol"] = {
        label = "Combat Pistol",
        toItems = {
            weapon_combatpistol = 1,
        },
        materials = {['weapon_trigger_pistol'] = 1,['weapon_barrel_pistol'] = 1, ['weapon_upper_pistol'] = 1, ['weapon_lower_pistol'] = 1, ['rubber'] = 10, ['plastic'] = 5,},
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 300,
        customSkillGain = 2,
        blueprint = 'weapon_combatpistol',
        metadata = {serial = true}
    },
    ["weapon_pistol50"] = {
        label = "Pistol .50",
        toItems = {
            weapon_pistol50 = 1,
        },
        materials = {['weapon_trigger_pistol'] = 1,['weapon_barrel_pistol'] = 1, ['weapon_upper_pistol'] = 1, ['weapon_lower_pistol'] = 1, ['rubber'] = 10, ['plastic'] = 5,},
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 450,
        customSkillGain = 2,
        blueprint = 'weapon_pistol50',
        metadata = {serial = true}
    },
    ["weapon_heavypistol"] = {
        label = "Heavy Pistol",
        toItems = {
            weapon_heavypistol = 1,
        },
        materials = {['weapon_trigger_pistol'] = 1,['weapon_barrel_pistol'] = 1, ['weapon_upper_pistol'] = 1, ['weapon_lower_pistol'] = 1, ['rubber'] = 10, ['plastic'] = 5,},
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 400,
        customSkillGain = 2,
        blueprint = 'weapon_heavypistol',
        metadata = {serial = true}
    },
    ["weapon_revolver"] = {
        label = "Revolver",
        toItems = {
            weapon_revolver = 1,
        },
        materials = {
            ["metalscrap"] = 450, ["iron"] = 250, ["plastic"] = 100,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 200,
        customSkillGain = 2,
        blueprint = 'weapon_revolver',
        metadata = {serial = true}
    },
    ["weapon_revolver_mk2"] = {
        label = "Revolver Mk2",
        toItems = {
            weapon_revolver_mk2 = 1,
        },
        materials = {
            ["metalscrap"] = 450, ["iron"] = 250, ["plastic"] = 150,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 150,
        customSkillGain = 2,
        blueprint = 'weapon_revolver_mk2',
        metadata = {serial = true}
    },
    ["weapon_doubleaction"] = {
        label = "Double Action Revolver",
        toItems = {
            weapon_doubleaction = 1,
        },
        materials = {
            ["metalscrap"] = 450, ["iron"] = 250, ["plastic"] = 150,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 50,
        customSkillGain = 2,
        blueprint = 'weapon_doubleaction',
        metadata = {serial = true}
    },
    ["weapon_navyrevolver"] = {
        label = "Navy Revolver",
        toItems = {
            weapon_navyrevolver = 1,
        },
        materials = {
            ["metalscrap"] = 450, ["iron"] = 250, ["plastic"] = 150,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 300,
        customSkillGain = 2,
        blueprint = 'weapon_navyrevolver',
        metadata = {serial = true}
    },
    --SMG
    ["weapon_microsmg"] = {
        label = "Micro SMG",
        toItems = {
            weapon_microsmg = 1,
        },
        materials = {['weapon_trigger_smg'] = 1, ['weapon_barrel_smg'] = 1, ['weapon_upper_smg'] = 1, ['weapon_lower_smg']= 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 350,
		customSkillGain = 2,
        blueprint = 'weapon_microsmg',
        metadata = {serial = true}
    },
    ["weapon_machinepistol"] = {
        label = "Machine Pistol",
        toItems = {
            weapon_machinepistol = 1,
        },
        materials = {['weapon_trigger_smg'] = 1, ['weapon_barrel_smg'] = 1, ['weapon_upper_smg'] = 1, ['weapon_lower_smg'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 500,
		customSkillGain = 3,
        blueprint = 'weapon_machinepistol',
        metadata = {serial = true}
    },
    ["weapon_gusenberg"] = {
        label = "Gusenberg",
        toItems = {
            weapon_gusenberg = 1,
        },
        materials = {['weapon_trigger_smg'] = 1, ['weapon_barrel_smg'] = 1, ['weapon_upper_smg'] = 1, ['weapon_lower_smg'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 1200,
		customSkillGain = 5,
        blueprint = 'weapon_gusenberg',
        metadata = {serial = true}
    },
    --Shotgun
    ["weapon_sawnoffshotgun"] = {
        label = "Sawnoff Shotgun",
        toItems = {
            weapon_sawnoffshotgun = 1,
        },
        materials = {['weapon_trigger_shotgun'] = 1,  ['weapon_barrel_shotgun'] = 1, ['weapon_frame_shotgun'] = 1,  ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 450,
		customSkillGain = 2,
        blueprint = 'weapon_sawnoffshotgun',
        metadata = {serial = true}
    },
    ["weapon_pumpshotgun"] = {
        label = "Pump Shotgun",
        toItems = {
            weapon_pumpshotgun = 1,
        },
        materials = {['weapon_trigger_shotgun'] = 1,  ['weapon_barrel_shotgun'] = 1, ['weapon_frame_shotgun'] = 1,  ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 275,
		customSkillGain = 2,
        blueprint = 'weapon_pumpshotgun',
        metadata = {serial = true}
    },
    ["weapon_pumpshotgun_mk2"] = {
        label = "Pump Shotgun Mk2",
        toItems = {
            weapon_pumpshotgun_mk2 = 1,
        },
        materials = {['weapon_trigger_shotgun'] = 1,  ['weapon_barrel_shotgun'] = 1, ['weapon_frame_shotgun'] = 1,  ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 275,
		customSkillGain = 2,
        blueprint = 'weapon_pumpshotgun_mk2',
        metadata = {serial = true}
    },
    ["weapon_heavyshotgun"] = {
        label = "Heavy Shotgun",
        toItems = {
            weapon_heavyshotgun = 1,
        },
        materials ={['weapon_trigger_shotgun'] = 1,  ['weapon_barrel_shotgun'] = 1, ['weapon_frame_shotgun'] = 1,  ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 250,
        customSkillGain = 2,
        blueprint = 'weapon_heavyshotgun',
        metadata = {serial = true}
    },
    ["weapon_dbshotgun"] = {
        label = "Double Barrel Shotgun",
        toItems = {
            weapon_dbshotgun = 1,
        },
        materials = {['weapon_trigger_shotgun'] = 1,  ['weapon_barrel_shotgun'] = 1, ['weapon_frame_shotgun'] = 1,  ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 700,
        customSkillGain = 2,
        blueprint = 'weapon_dbshotgun',
        metadata = {serial = true}
    },
    --Rifles
    ["weapon_assaultrifle"] = {
        label = "Assault Rifle",
        toItems = {
            weapon_assaultrifle = 1,
        },
        materials = {['weapon_trigger_rifle'] = 1,  ['weapon_barrel_rifle'] = 1, ['weapon_upper_rifle'] = 1, ['weapon_lower_rifle'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 450,
		customSkillGain = 2,
        blueprint = 'weapon_assaultrifle',
        metadata = {serial = true}
    },
    ["weapon_compactrifle"] = {
        label = "Compact Rifle",
        toItems = {
            weapon_compactrifle = 1,
        },
        materials = {['weapon_trigger_rifle'] = 1,  ['weapon_barrel_rifle'] = 1, ['weapon_upper_rifle'] = 1, ['weapon_lower_rifle'] = 1, ['rubber'] = 5, ['plastic'] = 2, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 350,
		customSkillGain = 2,
        blueprint = 'weapon_compactrifle',
        metadata = {serial = true}
    },
    ["weapon_carbinerifle"] = {
        label = "Carbine Rifle",
        toItems = {
            weapon_carbinerifle = 1,
        },
        materials = {['weapon_trigger_rifle'] = 1,  ['weapon_barrel_rifle'] = 1, ['weapon_upper_rifle'] = 1, ['weapon_lower_rifle'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 400,
		customSkillGain = 2,
        blueprint = 'weapon_carbinerifle',
        metadata = {serial = true}
    },

    -- Machine Gun
    ["weapon_mg"] = {
        label = "MG",
        toItems = {
            weapon_mg = 1,
        },
        materials = {['weapon_trigger_lmg'] = 1,  ['weapon_barrel_lmg'] = 1, ['weapon_upper_lmg'] = 1, ['weapon_lower_lmg'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 1500,
		customSkillGain = 2,
        blueprint = 'weapon_mg',
        metadata = {serial = true}
    },
    --Sniper Rifle
    ["weapon_sniperrifle"] = {
        label = "Sniper Rifle",
        toItems = {
            weapon_sniperrifle = 1,
        },
        materials = {['weapon_trigger_sniper'] = 1,  ['weapon_barrel_sniper'] = 1, ['weapon_upper_sniper'] = 1, ['weapon_lower_sniper'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 500,
		customSkillGain = 2,
        blueprint = 'weapon_sniperrifle',
        metadata = {serial = true}
    },
    ["weapon_marksmanrifle"] = {
        label = "Marksman Rifle",
        toItems = {
            weapon_marksmanrifle = 1,
        },
        materials = {['weapon_trigger_sniper'] = 1,  ['weapon_barrel_sniper'] = 1, ['weapon_upper_sniper'] = 1, ['weapon_lower_sniper'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 400,
		customSkillGain = 2,
        blueprint = 'weapon_marksmanrifle',
        metadata = {serial = true}
    },
    ["weapon_marksmanrifle_mk2"] = {
        label = "Marksman Rifle Mk2",
        toItems = {
            weapon_marksmanrifle_mk2 = 1,
        },
        materials = {['weapon_trigger_sniper'] = 1,  ['weapon_barrel_sniper'] = 1, ['weapon_upper_sniper'] = 1, ['weapon_lower_sniper'] = 1, ['rubber'] = 10, ['plastic'] = 5, },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'guns'},
        craftingSkill = 425,
        customSkillGain = 5,
        blueprint = 'weapon_marksmanrifle_mk2',
        metadata = {serial = true}
    },
    -- Explosives
    ["weapon_molotov"] = {
        label = "Molotov",
        toItems = {
            weapon_molotov = 1,
        },
        materials = {
            ["metalscrap"] = 750, ["bottle"] = 1,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'illegal'},
        craftingSkill = 250,
		customSkillGain = 5,
        blueprint = 'weapon_molotov',
    },
    ["weapon_pipebomb"] = {
        label = "Pipe Bomb",
        toItems = {
            weapon_pipebomb = 1,
        },
        materials = {
            ["metalscrap"] = 500, ["bottle"] = 1, ["thermite"] = 2,
        },
        craftingTime = 10000,
        category = 'Weapons',
        tables = {'illegal'},
        craftingSkill = 350,
		customSkillGain = 2,
        blueprint = 'weapon_pipebomb',
    },
    --Weapon Attachment
    ["clip_attachment"] = {
        label = "Clip",
        toItems = {
            clip_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 350, ["plastic"] = 200,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'guns'},
        craftingSkill = 100,
        customSkillGain = 2,
        blueprint = 'clip_attachment',
    },
    ["drum_attachment"] = {
        label = "Drum",
        toItems = {
            drum_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 750, ["plastic"] = 750,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'illegal'},
        craftingSkill = 350,
		customSkillGain = 2,
        blueprint = 'drum_attachment',
    },
    ["flashlight_attachment"] = {
        label = "Flashlight",
        toItems = {
            flashlight_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 250, ["glass"] = 250, ["rubber"] = 250,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'guns'},
        craftingSkill = 75,
		customSkillGain = 3,
        blueprint = 'flashlight_attachment',
    },
    ["suppressor_attachment"] = {
        label = "Suppressor",
        toItems = {
            suppressor_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 1500, ["glass"] = 400,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'illegal'},
        craftingSkill = 600,
		customSkillGain = 2,
        blueprint = 'suppressor_attachment',
    },
    ["smallscope_attachment"] = {
        label = "Small Scope",
        toItems = {
            smallscope_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 350, ["electronickit"] = 5, ["glass"] = 150,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'guns'},
        craftingSkill = 250,
        customSkillGain = 2,
        blueprint = 'smallscope_attachment',
    },
    ["medscope_attachment"] = {
        label = "Medium Scope",
        toItems = {
            medscope_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 550, ["electronickit"] = 5, ["glass"] = 150, ["rubber"] = 200,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'guns'},
        craftingSkill = 350,
        customSkillGain = 2,
        blueprint = 'medscope_attachment',
    },
    ["largescope_attachment"] = {
        label = "Large Scope",
        toItems = {
            largescope_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 750, ["electronickit"] = 5, ["glass"] = 200, ["rubber"] = 225,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'illegal'},
        craftingSkill = 450,
        customSkillGain = 5,
        blueprint = 'largescope_attachment',
    },
    ["holoscope_attachment"] = {
        label = "Holo Scope",
        toItems = {
            holoscope_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 350, ["electronickit"] = 10, ["rubber"] = 150, ["glass"] = 150,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'guns'},
        craftingSkill = 180,
        customSkillGain = 2,
        blueprint = 'holoscope_attachment',
    },
    ["grip_attachment"] = {
        label = "Grip",
        toItems = {
            grip_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 350, ["steel"] = 250, ["rubber"] = 150,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'guns'},
        craftingSkill = 125,
        customSkillGain = 2,
        blueprint = 'grip_attachment',
    },
    ["advscope_attachment"] = {
        label = "Advanced Scope",
        toItems = {
            advscope_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 450, ["electronickit"] = 10, ["glass"] = 150,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'illegal'},
        craftingSkill = 500,
		customSkillGain = 2,
        blueprint = 'advscope_attachment',
    },
    ["thermalscope_attachment"] = {
        label = "Thermal Scope",
        toItems = {
            thermalscope_attachment = 1,
        },
        materials = {
            ["metalscrap"] = 550, ["electronickit"] = 30, ["glass"] = 100, ["rubber"] = 75,
        },
        craftingTime = 5000,
        category = 'Attachments',
        tables = {'illegal'},
        craftingSkill = 1000,
        customSkillGain = 2,
        blueprint = 'thermalscope_attachment',
    },
    --Weapon Parts (Pistols)
    ["weapon_trigger_pistol"] = {
        label = "Pistol Trigger",
        toItems = {
            weapon_trigger_pistol = 1,
        },
        materials = {
            metalscrap = 15,
            rubber = 2,
            steel = 5
        },
        category = 'trigger',
        tables = {'trigger'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_trigger_pistol',
    },
    ['weapon_barrel_pistol'] = {
        label = "Pistol Barrel",
        toItems = {
            weapon_barrel_pistol = 1,
        },
        materials = {
            metalscrap = 20,
            rubber = 2,
            steel = 5
        },
        category = 'barrel',
        tables = {'barrel'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_barrel_pistol',
    },
    ['weapon_upper_pistol'] = {
        label = "Pistol Upper",
        toItems = {
            weapon_upper_pistol = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'upper',
        tables = {'upper'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_upper_pistol',
    },
    ['weapon_lower_pistol'] = {
        label = "Pistol Lower",
        toItems = {
            weapon_lower_pistol = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'lower',
        tables = {'lower'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_lower_pistol',
    },
    --Weapon Parts (Rifle)
    ["weapon_trigger_rifle"] = {
        label = "Rifle Trigger",
        toItems = {
            weapon_trigger_rifle = 1,
        },
        materials = {
            metalscrap = 15,
            rubber = 2,
            steel = 5
        },
        category = 'trigger',
        tables = {'trigger'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_trigger_rifle',
    },
    ['weapon_barrel_rifle'] = {
        label = "Rifle Barrel",
        toItems = {
            weapon_barrel_rifle = 1,
        },
        materials = {
            metalscrap = 20,
            rubber = 2,
            steel = 5
        },
        category = 'barrel',
        tables = {'barrel'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_barrel_rifle',
    },
    ['weapon_upper_rifle'] = {
        label = "Rifle Upper",
        toItems = {
            weapon_upper_rifle = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'upper',
        tables = {'upper'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_upper_rifle',
    },
    ['weapon_lower_rifle'] = {
        label = "Rifle Lower",
        toItems = {
            weapon_lower_rifle = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'lower',
        tables = {'lower'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_lower_rifle',
    },
    --Weapon Parts (Shotgun)
    ["weapon_trigger_shotgun"] = {
        label = "Shotgun Trigger",
        toItems = {
            weapon_trigger_shotgun = 1,
        },
        materials = {
            metalscrap = 15,
            rubber = 2,
            steel = 5
        },
        category = 'trigger',
        tables = {'trigger'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_trigger_shotgun',
    },
    ['weapon_barrel_shotgun'] = {
        label = "Shotgun Barrel",
        toItems = {
            weapon_barrel_shotgun = 1,
        },
        materials = {
            metalscrap = 20,
            rubber = 2,
            steel = 5
        },
        category = 'barrel',
        tables = {'barrel'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_barrel_shotgun',
    },
    ['weapon_frame_shotgun'] = {
        label = "Shotgun Frame",
        toItems = {
            weapon_frame_shotgun = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'upper',
        tables = {'upper'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_frame_shotgun',
    },
    --Weapon Parts (SMG)
    ["weapon_trigger_smg"] = {
        label = "SMG Trigger",
        toItems = {
            weapon_trigger_smg = 1,
        },
        materials = {
            metalscrap = 15,
            rubber = 2,
            steel = 5
        },
        category = 'trigger',
        tables = {'trigger'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_trigger_smg',
    },
    ['weapon_barrel_smg'] = {
        label = "SMG Barrel",
        toItems = {
            weapon_barrel_smg = 1,
        },
        materials = {
            metalscrap = 20,
            rubber = 2,
            steel = 5
        },
        category = 'barrel',
        tables = {'barrel'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_barrel_smg',
    },
    ['weapon_upper_smg'] = {
        label = "SMG Upper",
        toItems = {
            weapon_upper_smg = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'upper',
        tables = {'upper'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_upper_smg',
    },
    ['weapon_lower_smg'] = {
        label = "SMG Lower",
        toItems = {
            weapon_lower_smg = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'lower',
        tables = {'lower'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_lower_smg',
    },
    --Weapon Pats (Sniper)
    ["weapon_trigger_sniper"] = {
        label = "Sniper Trigger",
        toItems = {
            weapon_trigger_sniper = 1,
        },
        materials = {
            metalscrap = 15,
            rubber = 2,
            steel = 5
        },
        category = 'trigger',
        tables = {'trigger'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_trigger_sniper',
    },
    ['weapon_barrel_sniper'] = {
        label = "Sniper Barrel",
        toItems = {
            weapon_barrel_sniper = 1,
        },
        materials = {
            metalscrap = 20,
            rubber = 2,
            steel = 5
        },
        category = 'barrel',
        tables = {'barrel'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_barrel_sniper',
    },
    ['weapon_upper_sniper'] = {
        label = "Sniper Upper",
        toItems = {
            weapon_upper_sniper = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'upper',
        tables = {'upper'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_upper_sniper',
    },
    ['weapon_lower_sniper'] = {
        label = "Sniper Lower",
        toItems = {
            weapon_lower_sniper = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'lower',
        tables = {'lower'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_lower_sniper',
    },
    --Weapon Parts (LMG)
    ["weapon_trigger_lmg"] = {
        label = "LMG Trigger",
        toItems = {
            weapon_trigger_lmg = 1,
        },
        materials = {
            metalscrap = 15,
            rubber = 2,
            steel = 5
        },
        category = 'trigger',
        tables = {'trigger'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_trigger_lmg',
    },
    ['weapon_barrel_lmg'] = {
        label = "LMG Barrel",
        toItems = {
            weapon_barrel_lmg = 1,
        },
        materials = {
            metalscrap = 20,
            rubber = 2,
            steel = 5
        },
        category = 'barrel',
        tables = {'barrel'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_barrel_lmg',
    },
    ['weapon_upper_lmg'] = {
        label = "LMG Upper",
        toItems = {
            weapon_upper_lmg = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'upper',
        tables = {'upper'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_upper_lmg',
    },
    ['weapon_butt_lmg'] = {
        label = "LMG Lower",
        toItems = {
            weapon_butt_lmg = 1,
        },
        materials = {
            metalscrap = 25,
            rubber = 2,
            steel = 5
        },
        category = 'lower',
        tables = {'lower'},
        craftingSkill= 50,
        customSkillGain = 10,
        blueprint = 'weapon_buttstock_lmg',
    },
}


-- Search for more tables here, for example: https://gta-objects.xyz/objects
-- For icons see https://pictogrammers.com/library/mdi/
Config.CraftingTables = {
    ['basic'] = {--Name of the table
        title = "Basic Crafting", --Name displayed on target(Get to crafting bitch)
		spawnTable = {
			{ coords = vector4(139.76, -384.28, 42.26, 160.53), prop = 'prop_tool_bench02' },
		},
        skipPlaceObjectOnGroundProperly = true, -- Defaults to false, if set to true then object wont be placed onto ground. Useful for placing items on tables etc
		--gang = {},
		--job = {},
    },
    ['guns'] = {--good placement
        title = "Weapon Crafting",
        spawnTable = {
			{ coords = vector4(119.99, -3182.67, 5.02, 91.00), prop = 'gr_prop_gr_bench_01b' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
    ['illegal'] = {--good placement
        title = "Illegal Crafting",
        spawnTable = {
			{ coords = vector4(2357.96, 3118.84, 47.21, 170.15), prop = 'gr_prop_gr_bench_02b' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
	['electronics'] = {--placed
        title = "Gadgets Crafting",
        locations = { vec3(-1049.85, -240.03, 44.02), },
        skipPlaceObjectOnGroundProperly = false,
    },
    ['ammo'] = {--good placement
        title = "Ammo Crafting",
        spawnTable = {
			{ coords = vec4(756.97, -3192.18, 3.90, 359.45), prop = 'gr_prop_gr_bench_04a' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
    ['trigger'] = {--good placement
        title = "Trigger Crafting",
        spawnTable = {
			{ coords = vec4(4.05, 3730.82, 38.74, 220.98), prop = 'gr_prop_gr_bench_02a' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
    ['barrel'] = {--good placement
        title = "Barrel Crafting",
        spawnTable = {
			{ coords = vec4(2306.97, 4868.06, 39.63, 318.97), prop = 'gr_prop_gr_bench_04a' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
    ['upper'] = {--good placement
        title = "Upper Receiver Crafting",
        spawnTable = {
			{ coords = vec4(1927.83, 3904.95, 30.68, 133.8), prop = 'gr_prop_gr_bench_04a' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
    ['lower'] = {--good placement
        title = "Lower Receiver Crafting",
        spawnTable = {
			{ coords = vec4(-671.5, 5838.44, 16.38, 136.52), prop = 'gr_prop_gr_bench_02b' },
		},
        skipPlaceObjectOnGroundProperly = true,
    },
}

Config.UseSundownUtils = false

Config.BlueprintDudes = {-- SET THIS TO Config.BlueprintDudes = nil TO DISABLE
    {
        model = 'u_m_m_blane',--placed
        type = 'illegal',
        coords = vector4(2369.43, 3157.26, 48.21, 40.22),
        animation = 'WORLD_HUMAN_DRUG_DEALER',
    },
    {
        model = 'cs_old_man2',--placed
        type = 'ammo',
        coords = vector4(-672.27, 5828.2, 17.33, 229.77),
        animation = 'WORLD_HUMAN_SMOKING',
    },
    {
        model = 'a_m_m_mlcrisis_01',--placed
        type = 'guns',
        coords = vector4(1601.58, 6444.89, 25.33, 170.15),
	},  animation = 'WORLD_HUMAN_SMOKING',
	{
		model = 'csb_ramp_hipster',--placed
		type = 'electronics',
		coords = vec4(-1064.45, -246.22, 39.73, 20.29),
		animation = 'WORLD_HUMAN_DRINKING',
    },
    {
		model = 'g_f_y_vagos_01',--placed
		type = 'trigger',
		coords = vector4(11.66, -1611.09, 29.41, 127.62),
		animation = 'WORLD_HUMAN_HANG_OUT_STREET',
    },
    {
		model = 'g_f_y_families_01',--placed
		type = 'barrel',
		coords = vector4(863.54, -2107.77, 30.4, 311.41),
		animation = 'WORLD_HUMAN_DRUG_DEALER',
    },
    {
		model = 'g_m_y_ballaorig_01',--placed
		type = 'upper',
		coords = vector4(99.97, -1954.65, 20.73, 298.01),
		animation = 'WORLD_HUMAN_SMOKING_POT',
    },
    {
		model = 'g_m_y_lost_02',--placed
		type = 'lower',
		coords = vector4(95.91, 3649.4, 39.75, 93.28),
		animation = 'WORLD_HUMAN_DRINKING',
    },
}
