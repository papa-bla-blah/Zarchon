# ZARCHON - Executive Summary
**January 2026**

---

**GitHub:** https://github.com/papa-bla-blah/Zarchon

---

## What Is It?

Zarchon is a modern remake of *Archon Ultra* (1994) — a cult classic that blended chess-like strategy with real-time arcade combat. When two pieces meet on the board, players fight it out in a live battle arena rather than automatic captures.

Nobody has executed this formula well in modern times. Existing remakes lack online play and feel dated. This is the opportunity.

---

## Target Platforms

- **Steam** (Windows/Mac/Linux) — primary
- **Google Play** (Android) — primary  
- **Linux/Ubuntu, Raspberry Pi, x86 SBCs** — supported
- **Console** — future

Critical design requirement: **input parity** across touch, mouse/keyboard, and controller. No platform gets an unfair advantage.

---

## Current Progress

### ✅ Research Complete
- Analyzed original Archon mechanics (luminosity cycles, unit stats, combat dynamics)
- Studied Archon Classic (2010 remake) strengths and weaknesses
- Documented cross-platform input constraints

### ✅ Phase 2 Planning Complete
Two asymmetric factions fully designed with 9 unit types each:

**THE ASCENDANCY (Tech)**
- Sentinel Drones (×4 pawns), Aegis Mech, Striker Mech, Nano Swarm, Tech Priest (leader), Recon Drone Squad, Gunship

**GAIA'S CHOSEN (Nature)**
- Thornlings (×4 pawns), Stone Guardian, Stalker Beast, Mimic Elemental, Earth Shaman (leader), Storm Hawks, Ancient Wyrm

Balance verified: equal total HP (95 each), comparable damage output, counter-web where every unit has favorable and unfavorable matchups.

### ✅ Phase 1 Board Prototype Built
- 8×8 hex grid with 5 terrain types
- 3D elevation system (peaks/valleys)
- 3 visual themes ready for feedback
- Click-to-select with 3-hex movement range display
- React-based, single-file HTML — runs in any browser, no build step

---

## Tech Stack

**React** (single-file prototypes for rapid iteration)

Pivoted away from Godot engine to prioritize speed and cross-platform web deployment. The Godot work is archived but the design documents remain valid.

---

## What's Next

1. **Get theme feedback** — pick visual direction
2. **Add pieces to board** — place pawns, test movement rules
3. **Build combat arena** — the real-time battle system
4. **Polish & deploy** — Vercel/GitHub Pages for web demo, then native builds

---

## Why This Will Work

- Proven nostalgic appeal (Archon has dedicated fans still playing 40-year-old versions)
- No modern competitor has nailed it
- Asymmetric factions + real-time combat = strategic depth + adrenaline
- Cross-platform from day one
- Rapid iteration approach — playable prototypes over planning documents

---

**Repo:** https://github.com/papa-bla-blah/Zarchon

**Status:** Playable board prototype ready. Unit implementation next.

---
*~450 words*
