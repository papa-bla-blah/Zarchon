# ZARCHON Development Log

## Project Overview
**Zarchon** - A modern reimagining of Archon Ultra (1994) combining hex-grid tactical strategy with real-time arcade combat.

**Target Platforms:** Steam, Google Play (Android), Linux/Ubuntu, Raspberry Pi, Console (future)

**Core Design Principle:** Input parity across touch, mouse/keyboard, and controller - no advantage for any input method.

---

## Development Phases

### ✅ Phase 1: Core Board Mechanics (COMPLETE)
- [x] Hex grid system with axial coordinates
- [x] 3D elevation (mountains/valleys)
- [x] SVG pattern textures for terrain types
- [x] Movement validation (3-hex range)
- [x] Visual feedback systems
- [x] Luminosity cycling mechanic
- [x] A* pathfinding
- [x] Cross-platform input foundation

### 🔄 Phase 2: Team Design & Units (IN PROGRESS)
- [x] Research Archon unit stats and balance
- [x] Design two asymmetric factions
- [x] Document unit abilities and counters
- [ ] Implement pawn units (Sentinel/Thornling)
- [ ] Implement assault pairs (Aegis/Striker, Guardian/Stalker)
- [ ] Implement specialist pairs (Nano Swarm/Mimic, Leaders)
- [ ] Implement aerial pairs (Drone Squad/Storm Hawks, Gunship/Wyrm)
- [ ] Balance testing

### 📋 Phase 3: Combat Arena (PLANNED)
- [ ] Real-time combat scene
- [ ] Attack systems (projectile, AOE, beam, melee)
- [ ] Health bars and damage feedback
- [ ] Secondary abilities
- [ ] Combat resolution

### 📋 Phase 4: Polish & Expansion (PLANNED)
- [ ] Larger board sizes (8x8+)
- [ ] Visual polish and animations
- [ ] Sound design
- [ ] AI opponent
- [ ] Multiplayer foundation

---

## Changelog

### 2026-01-07 - Phase 2 Planning Complete
**Added:**
- Complete faction design documents
- THE ASCENDANCY (Tech faction): 9 unit types
- GAIA'S CHOSEN (Nature faction): 9 unit types
- Balance analysis and counter-web documentation
- Cross-platform input design rules

**Research Completed:**
- Archon/Archon Ultra unit statistics
- Asymmetric game balance principles
- Touch-friendly combat design patterns

### 2026-01-06 - Phase 1 Complete
**Completed:**
- React-based hex grid prototype
- 3D elevation system
- Terrain type system (5 types)
- Movement validation
- Visual feedback for selection/movement

---

## Architecture Notes

### Faction Design Philosophy
Both factions use the same structural template for balance:
- 4 Pawns (expendable, tactical)
- 2 Assault units (tank + glass cannon)
- 2 Specialists (shapeshifter + leader)
- 2 Aerial (swarm + elite flyer)

### Total: 9 unique unit types per faction (18 total)

### Key Balance Metrics
| Metric | Target |
|--------|--------|
| Total HP per team | 95 |
| Win rate per faction | 45-55% |
| Counter relationships | Each unit counters 2+, countered by 2+ |

---

## File Structure
```
zarchon-1/
├── docs/
│   └── design/
│       └── PHASE2-TEAM-PLANNING.md
├── Zarchon/
│   ├── scenes/
│   ├── scripts/
│   │   ├── HexCell.gd
│   │   ├── HexGrid.gd
│   │   ├── Unit.gd
│   │   └── Board.gd
│   └── project.godot
├── DEVLOG.md (this file)
└── README.md
```

---

## References
- Original Archon (1983) by Free Fall Associates
- Archon Ultra (1994) - SSI
- Archon Classic (2010) by React Games
- Red Blob Games hex grid mathematics
