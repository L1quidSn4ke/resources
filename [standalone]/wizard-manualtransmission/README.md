# Wizard Transmission
A FiveM resource that adds manual transmission functionality to vehicles, allowing players to manually shift gears and use a clutch system.

## Features
- Manual and automatic transmission modes
- Clutch system support
- Customizable UI for gear display
- RPM warning system
- RPM cut limit
- Integration with Wizard Mileage script
- Configurable key bindings
- Chat notifications for gear changes

## Dependencies
- None required
- Optional: [Wizard Mileage](https://forum.fivem.net/t/release-wizard-mileage/106698) for mileage tracking and clutch wear integration

## Installation
1. Download the latest release
2. Extract the `wizard-manualtransmission` folder to your server's resources directory
3. Add `ensure wizard-manualtransmission` to your server.cfg
4. Restart your server

## Configuration
All configuration options are available in `config.lua`:

### UI Settings
```lua
lua
Config.ShowUI = true                             -- Enable/disable gear display UI
Config.UIloc = "custom"                          -- UI position: "top-right", "top-left", "custom"
Config.CustomUILoc = {top = 95, right = 46.7}    -- Custom UI position (percentage)
```

### Gameplay Settings
```lua
lua
Config.GearBoxMode = "gearboxmode"               -- Command to toggle transmission mode
Config.WizardMileage = true                      -- Enable Wizard Mileage integration
Config.ManualClutch = true                       -- Enable/disable clutch requirement
Config.RpmCut = true                             -- Enable Rpm Cut system
Config.RpmCutTime = 130                          -- Rpm cut limit timer, lower = more beautiful sound (110 - 200)
Config.RpmCutMax = 1.0                           -- The maximum rpm when using Rpm Cut timer (0.0 - 1.0)
Config.RpmCutMin = 0.8                           -- The minimum rpm when using Rpm Cut timer (0.0 - 1.0)
Config.SendChatText = false                      -- Enable/disable gear change notifications
```

### Key Bindings
```lua
lua
Config.ShiftUp = 188                             -- Key for shifting up (Arrow up)
Config.ShiftDown = 187                           -- Key for shifting down (Arrow down)
Config.ClutchKey = 21                            -- Key for clutch (Left Shift)
```

## Usage
### Basic Controls
- Use `/gearboxmode` to toggle between manual and automatic transmission
- In manual mode:
  - Press Arrow Up to shift up
  - Press Arrow Down to shift down
  - Hold Left Shift for clutch (if enabled)

### UI Display
The gear display shows:
- Current gear number
- Warning indication when RPM is too high
- Neutral (N) when stationary
- Reverse (R) when in reverse

## Development
### File Structure
```
wizard-transmission/
├── client/
│   └── client.lua
├── html/
│   ├── index.html
│   └── script.js
├── config.lua
├── fxmanifest.lua
└── README.md
```

## Support
For support, bug reports, or feature requests:
- Join our [Discord Server](https://discord.gg/ZBvacHyczY)
- Visit our [GitHub Repository](https://github.com/CodeWizardsDev)

## Credits
Created by The_Hs5, CodeWizards Development Team

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Links
- [CodeWizards Discord](https://discord.gg/ZBvacHyczY)
- [CodeWizards GitHub](https://github.com/CodeWizardsDev)
