# Installation Guide 📋

## Starting order:
### QBCore
```lua
- ensure qb-core                    - Framework
- ensure ox_lib                     - apex_lib dependency
- ensure ox_inventory               - Only if using this inventory
- ensure ox_target                  - Only if using this target resource
- ensure apex_lib                   - Apex resource dependency
- ensure [qb]                       - QBCore scripts
- ensure [apex]                     - All Apex Studios Scripts
```

### QBox
```lua
- ensure qb_box                     - Framework
- ensure ox_lib                     - apex_lib dependency
- ensure ox_inventory               - Only if using this inventory
- ensure ox_target                  - Only if using this target resource
- ensure apex_lib                   - Apex resource dependency
- ensure [qbx]                      - QBox scripts
- ensure [apex]                     - All Apex Studios Scripts
```

### ESX
```lua
- ensure ox_lib                     - apex_lib dependency
- ensure es_extended                - Framework
- ensure ox_inventory               - Only if using this inventory
- ensure ox_target                  - Only if using this target resource
- ensure apex_lib                   - Apex resource dependency
- ensure [esx]                      - ESX scripts
- ensure [apex]                     - All Apex Studios Scripts
```

## Setting up the config:
After downloading this resource from your keymaster, you'll need to configure the settings in `apex_lib/config/config.lua`. In this file, you'll find a comprehensive list of supported scripts used by most of our resources.

Please note that not all our scripts utilize every feature listed here, so you may not need to configure everything. If you're not using a specific script that requires certain settings, you can leave those configurations as they are.

----------------------------------------------------------------------