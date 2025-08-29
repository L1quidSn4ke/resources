---
Config = {}
Config.DiscordWebHook = 'https://discord.com/api/webhooks/1365104820163444806/IenVbBirURyA3V9CRl7GTPwqn0c0siqgvk3XEvyNgGUaEa6L6S_yq1nAsYy4VsAtSSaE'
Config.save = 'json' -- kvp, json
Config.vehicle_table = 'player_vehicles' -- vehicle table must have model column (name not hash)
Config.useSQLvehicle = true -- use mysql async to fetch vehicle table else SqlVehicleTable will use
Config.SqlVehicleTable = QBCore and QBCore.Shared and QBCore.Shared.Vehicles and QBCore.Shared.Vehicles or {} -- example qbcore shared vehicle

-- Custom Category
Config.Category = 'all' -- select a custom category | set this to 'all' if you want to Screenshot all vehicle categories

-- Permission
Config.owners = {
    --['license:df845523fc29c5159ece179359f22a741ca2ca9a'] = true,
    ['license:2d151362ec2b72a6001f3b6fa92789791369c8f8'] = true,
    --add more here
}