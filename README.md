# ZARCHON

**A modern reimagining of Archon Ultra (1994)**

Hex-grid tactical strategy meets real-time arcade combat.

![Status](https://img.shields.io/badge/Status-In%20Development-yellow)
![Phase](https://img.shields.io/badge/Phase-2%20Team%20Design-blue)
![Engine](https://img.shields.io/badge/Engine-Godot%204.5-purple)

---

## 🎮 What is Zarchon?

Zarchon combines two distinct gameplay modes:
1. **Strategic Phase:** Position units on a hex-grid board with terrain and elevation
2. **Combat Phase:** When units collide, battle in real-time arcade combat

Inspired by the classic Archon series, Zarchon modernizes the formula with:
- Two asymmetric factions (Tech vs Nature)
- Cross-platform play with input parity
- Hex-based terrain with tactical depth

---

## 🎯 Target Platforms

| Platform | Status |
|----------|--------|
| Steam (Windows/Mac/Linux) | Primary |
| Google Play (Android) | Primary |
| Linux/Ubuntu | Supported |
| Raspberry Pi | Supported |
| Console | Future |

---

## 📁 Project Structure

```
zarchon-1/
├── game/                 # ← ACTIVE Godot project
│   ├── scenes/
│   ├── scripts/
│   │   ├── HexCell.gd
│   │   ├── HexGrid.gd
│   │   ├── Unit.gd
│   │   └── Board.gd
│   └── project.godot
├── docs/
│   └── design/
│       └── PHASE2-TEAM-PLANNING.md
├── _archive_stub/        # ← OLD/UNUSED files (ignore)
├── DEVLOG.md
└── README.md
```

**To open in Godot:** Import `game/project.godot`

---

## ⚔️ Factions

### THE ASCENDANCY (Technocracy)
*"Through logic and innovation, we shall inherit the cosmos."*

Chrome mechs, drones, and energy weapons. Excels at precision damage and defensive shields.

### GAIA'S CHOSEN (Earth/Nature)  
*"The planet remembers. The planet protects. The planet avenges."*

Organic beasts, elementals, and natural forces. Excels at area control and sustained damage.

---

## 🚀 Development Status

See [DEVLOG.md](DEVLOG.md) for detailed progress.

- ✅ **Phase 1:** Core board mechanics (hex grid, terrain, movement)
- 🔄 **Phase 2:** Team design and unit implementation (IN PROGRESS)
- 📋 **Phase 3:** Combat arena system
- 📋 **Phase 4:** Polish, AI, and multiplayer

---

## 📚 Documentation

- [Phase 2: Team Planning](docs/design/PHASE2-TEAM-PLANNING.md) - Faction and unit design
- [Quickstart Guide](game/QUICKSTART.md) - How to run the game

---

## 🙏 Credits

- Inspired by **Archon** (1983) by Free Fall Associates
- **Archon Ultra** (1994) by Strategic Simulations Inc.
- Hex grid mathematics from Red Blob Games
- Built by Liam with Claude (Anthropic)

---

*Last Updated: January 2026*
