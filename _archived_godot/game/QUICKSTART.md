# 🎮 ZARCHON - QUICK START GUIDE

## Download and Setup (5 minutes)

### Step 1: Download the Project
All files are ready in the zarchon folder. Download the entire folder.

### Step 2: Installation Options

**OPTION A: Automatic Setup (Recommended)**
```bash
# Open Terminal on your M1 Mac
cd ~/Downloads/zarchon
chmod +x setup.sh
./setup.sh
```

**OPTION B: Manual Setup**
1. Create folder: `mkdir ~/Documents/Zarchon`
2. Copy all files into it
3. Open Godot → Import → Select `project.godot`

### Step 3: Run the Game
1. Open Godot 4.5.1
2. Import the project
3. Press **F5** or click the **Play** button

## What You'll See

A 3x3 hex grid with:
- 2 **Cyan units** (Light side) at top
- 2 **Orange units** (Dark side) at bottom

## How to Play (Current MVP)

1. **Click a cyan unit** to select it (yellow ring appears)
2. **Click an empty hex** to move there
3. **Click an orange unit** to attack (placeholder - prints to console)

## Current Features

✅ Hex grid navigation  
✅ Unit selection and movement  
✅ A* pathfinding  
✅ Luminosity cycle (watch hexes change color)  
✅ Cross-platform input support  

⚠️ Combat arena (coming in Phase 2)  
⚠️ Special abilities (coming in Phase 2)  

## Next Development Steps

### Week 1-2: You Are Here ✓
- [x] 3x3 hex grid
- [x] 2 units per side
- [x] Basic movement

### Week 2-3: Combat Arena
```
TODO:
- Create combat scene
- Real-time movement
- Attack mechanics
- Health bars
- Victory/defeat
```

### Week 3-4: Scale Up
```
TODO:
- Expand to 7x7 grid
- Add more unit types
- Terrain variety
- Special abilities
```

## Testing Cross-Platform Input

The game is designed for input parity. Test on:

**Desktop:**
- Mouse click to play

**Mobile:**
- Tap to play (export to Android)

**Controller:**
- Connect controller and use A button

## File Structure

```
zarchon/
├── project.godot       ← Godot project file
├── icon.svg           ← Default icon
├── README.md          ← Full documentation
├── setup.sh           ← Auto-setup script
├── scenes/
│   └── Main.tscn     ← Main game scene
└── scripts/
    ├── HexCell.gd    ← Hex tile logic
    ├── HexGrid.gd    ← Grid + pathfinding
    ├── Unit.gd       ← Unit behavior
    └── Board.gd      ← Game controller
```

## Troubleshooting

**"Project won't open"**
- Make sure you have Godot 4.5.1 (not 3.x)
- Check you selected `project.godot` not the folder

**"No units visible"**
- Press F5 to run (don't just open the scene)
- Check the console for errors

**"Can't select units"**
- Make sure you're clicking the cyan units (light side)
- Game starts as Light player's turn

## Console Commands (for testing)

When running, open the Godot console to see:
```
HexGrid generated: 3 x 3 = 9 cells
Board initialized: 3x3 grid
Units spawned: 2 Light, 2 Dark
Selected: Knight (Light) HP:100/100 at HexCell(0, 0, 0)
Combat: Knight vs Goblin
```

## Next Session Goals

1. **Get the MVP running** - Just run it and click around!
2. **Plan combat arena** - Decide on combat mechanics
3. **Choose art style** - Placeholder graphics or start with assets?

## Questions?

The project is fully documented in `README.md`

**Ready to code more?** Tell me what you want to work on next:
- Combat arena
- More units
- Better graphics
- Sound effects
- AI opponents

---

**Have fun! You now have a working hex-based strategy game foundation! 🎉**
