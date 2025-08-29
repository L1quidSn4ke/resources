--[[ ===================================================== ]]--
--[[             MH Airdrops Script by MaDHouSe            ]]--
--[[ ===================================================== ]]--

Config = {}

Config.MinPlayerOnline = 4 -- the total players online must be above this value before this works.

Config.Notify = "okokNotify" -- Default:(qb-core), you can also use (roda-notify/okokNotify)
Config.NotifyTitle = "Airdrops"

-- you can only use this if you have (mh-dailyactivities)
Config.UseDailyActivities = false -- only true if you have mh-dailyactivities..
Config.DailyTaskID = 11 -- the `Config.Tasks` from mh-dailyactivities, its the id of the task..

Config.Timer = 60
Config.Cooldown = { min = 40, max = 60 }

Config.Item1 = "airdrop"
Config.Item2 = "airdrop2"

Config.Object = 'prop_drop_armscrate_01'

Config.UseItemsDrop = true
Config.UseRareItemsDrop = true
Config.UseAmmoDrop = false
Config.UseWeaponDrop = false
Config.UseAllDrops = false

Config.whatBooty = 1 -- default 0 (1 is Items 2 is Weapons 3 is ammo, only if you set something above to false)

Config.UseJackpotItem = true
Config.JackpotItem = 'markedbills'
Config.JackpotAmount = math.random(10, 2000)

Config.NotAllowedJobs = {--[[
    ['leo'] = true,
    ["police"] = true,
    ["sahp"] = true,
    ["pbp"] = true,
    ["ranger"] = true,
    ["sheriff"] = true,
    ["doj"] = true,]]
}

-- Locations of where the Airdrops can spawn
Config.Locations = {
    vector3(616.93, -2022.93, 9.45),
    vector3(347.2, -933.3, 59.41),
    vector3(-1170.51, -2005.73, 13.16),
    vector3(-1238.84, -487.13, 48.47),
    vector3(-1259.58, -375.13, 59.29),
    vector3(-1736.72, 158.22, 64.37),
    vector3(-2199.42, 279.22, 194.6),
    vector3(309.75, -226.72, 61.58),
    vector3(337.49, 195.97, 132.69),
    vector3(-2948.6, 385.12, 15.8),
    vector3(-3123.01, 1956.19, 2.53),
    vector3(-1482.56, 4524.02, 54.13),
    vector3(-1362.24, 4847.79, 145.95),
    vector3(482.11, 5609.9, 788.88),
    vector3(-234.9733, -1372.1353, 31.2582),
    vector3(0.27, 6189.56, 36.05),
    vector3(-22.0, 6899.05, 2.57),
    vector3(-1134.82, 4965.51, 221.38),
    vector3(-1180.06, 4927.41, 223.29),
    vector3(-1078.36, 4940.64, 229.22),
    vector3(1670.6, 6686.24, 2.54),
    vector3(3424.97, 5172.28, 7.38),
    vector3(3573.6, 3698.78, 53.29),
    vector3(2117.34, 1815.51, 94.66),
    vector3(2754.86, 1467.69, 51.37),
    vector3(2506.98, -346.53, 118.03),
    vector3(1781.8, -1608.12, 112.43),
    vector3(1361.65, -3188.92, 6.03),
    vector3(293.1, -3333.77, 5.79),
    vector3(-492.53, -2677.95, 8.76),
    vector3(-1968.23, -3035.88, 13.94),
    vector3(-1067.44, -2162.47, 13.28),
}

-- Placeholder (Don't change this)
Config.Items = {
    ['basic'] = {
        [1] = {name = "lockpick"},
        [2] = {name = "advancedlockpick"},
        [3] = {name = "armor"},
        [4] = {name = "coke_brick"},
        [5] = {name = "weed_brick"},
    },
    ['rare'] = {
        [1] = {name = "meth"},
        [2] = {name = "trojan_usb"},
        [3] = {name = "security_card_01"},
        [4] = {name = "security_card_02"},
        [5] = {name = "ifaks"},
        [6] = {name = "diamond_ring"},
        [7] = {name = "goldore"},
        [8] = {name = "goldingot"},
        [9] = {name = "methkey"},
        [10] = {name = "cocainekey"},
        [11] = {name = "weedkey"},
        [12] = {name = "md_ancientcoin"},
        [13] = {name = "labkey"},
    },
   --[[ ['weapons'] = {
        [1] = ['pistol'] = { ['name'] = "pistol", ['model'] = "weapon_pistol" },
        [2] = ['dagger'] = { ['name'] = "dagger", ['model'] = "weapon_dagger" },
        [3] = ['grenade'] = { ['name'] = "grenade", ['model'] = "weapon_grenade" },
    },
    ['ammo'] = {
        [1] = ['pistol'] = { ['name'] = "pistol_ammo", ['amount'] = 1, },
        [1] = ['smg'] = { ['name'] = "smg_ammo", ['amount'] = 1, },
        [1] = ['rifle'] = { ['name'] = "rifle_ammo", ['amount'] = 1, },
        [1] = ['shotgun'] = { ['name'] = "shotgun_ammo", ['amount'] = 1, },
        [1] = ['mg'] = { ['name'] = "mg_ammo", ['amount'] = 1, },
        [1] = ['snp'] = { ['name'] = "snp_ammo", ['amount'] = 1, },
        [1] = ['emp'] = { ['name'] = "emp_ammo", ['amount'] = 1, },
    },]]
}
