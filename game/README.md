# ZARCHON - MVP v0.1

A modern remake of Archon Ultra (1994) built in Godot 4.5.1

## About

Zarchon combines hex-based strategic gameplay with real-time arcade combat, inspired by the classic Archon Ultra. This MVP focuses on core mechanics with cross-platform input parity.

## Features (MVP)

- ✅ 3x3 Hex Grid (axial coordinates)
- ✅ 2 Units per side (Light vs Dark)
- ✅ Luminosity Cycle (Archon Ultra mechanic)
- ✅ A* Pathfinding
- ✅ Cross-platform input (Touch/Mouse/Controller)
- ✅ Unit selection and movement
- ⚠️ Combat system (placeholder - will initiate but not playable yet)

## Project Structure

```
zarchon/
├── project.godot          # Project configuration
├── icon.svg               # Default icon
├── scenes/
│   └── Main.tscn         # Main game scene
└── scripts/
    ├── HexCell.gd        # Individual hex tile
    ├── HexGrid.gd        # Grid manager + pathfinding
    ├── Unit.gd           # Unit base class
    └── Board.gd          # Game board controller
```

## Setup Instructions (M1 Mac)

1. **Copy project to your Mac:**
   - Download all files from `/mnt/user-data/outputs/`
   - Create folder: `~/Documents/Zarchon/`
   - Copy all files maintaining the directory structure

2. **Open in Godot:**
   - Launch Godot 4.5.1
   - Click "Import"
   - Navigate to `~/Documents/Zarchon/project.godot`
   - Click "Import & Edit"

3. **Run the game:**
   - Press F5 or click the Play button
   - You should see a 3x3 hex grid with 4 units

## How to Play (Current MVP)

1. **Select a unit:** Click on a Light (cyan) unit
2. **Move:** Click on an empty hex within range
3. **Attack (placeholder):** Click on an enemy unit
   - Currently just prints to console
   - Combat arena will be added in next phase

## Controls

### Mouse/Keyboard
- Left Click: Select unit / Move / Attack
- Right Click: Cancel selection
- WASD: (Combat movement - not yet implemented)
- 1/2: Abilities (not yet implemented)

### Touch (Mobile)
- Tap: Select / Move / Attack
- Double-tap: Cancel

### Controller
- A Button: Select / Move / Attack
- B Button: Cancel
- D-Pad/Left Stick: Navigation

## Next Steps (Phase 2)

1. **Combat Arena:**
   - Create separate combat scene
   - Real-time 2D arcade combat
   - Health bars, attacks, special abilities

2. **More Units:**
   - Expand to 5+ unit types per side
   - Unique abilities and stats

3. **Larger Boards:**
   - Scale from 3x3 to 7x7 or larger
   - Add terrain variety

4. **Visual Polish:**
   - Replace placeholder graphics
   - Add animations
   - Particle effects

## Technical Notes

### Hex Grid System
- Uses axial coordinates (q, r) with derived s
- Flat-top orientation for isometric view
- A* pathfinding implementation
- Red Blob Games hex math

### Cross-Platform Input
- Unified input actions in `project.godot`
- All controls map to same actions
- No advantage for any input method

### Performance
- Optimized for mobile (GL Compatibility renderer)
- Target: 60fps on Raspberry Pi 4

## Development

- **Engine:** Godot 4.5.1
- **Language:** GDScript
- **Target Platforms:** 
  - Steam (Windows, Linux, macOS)
  - Google Play (Android)
  - Raspberry Pi
  - Consoles (future)

## Credits

- Inspired by Archon Ultra (1994) by Free Fall Associates
- Hex grid math: Red Blob Games
- Built by Liam with Claude (Anthropic)

## License

TBD - This is a prototype/MVP

---

**Version:** 0.1.0 (MVP)  
**Date:** January 2026  
**Status:** Prototype - Core mechanics functional
