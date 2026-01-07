# ZARCHON - Human Decision Points & Tasks
**Compiled: January 7, 2026**

---

## 🔴 CRITICAL (Blocks Next Steps)

### 1. Visual Theme Selection
**Choose one:** Fantasy Classic, Sci-Fi Grid, or Earth Tones?
- View the board prototype: `src/board-prototype.html`
- Or hybrid approach (pick elements from each)?
- **Why critical:** Sets art direction for all future assets

### 2. Pawn Count Per Side
**Options:**
- (A) 4 pawns — cleaner, faster games
- (B) 5-6 pawns — more tactical depth, longer games
- **Why critical:** Affects board layout, balance math, starting positions

---

## 🟠 HIGH PRIORITY (Major Design Decisions)

### 3. Leader Unit Role
**Options:**
- (A) Combat-capable but NOT required for victory
- (B) Required alive to win (Chess king style — lose leader = lose game)
- (C) Grants passive bonuses while alive (weaker if leader dies)
- **Impact:** Dramatically changes strategy and risk tolerance

### 4. Terrain Bonus Strength
**Options:**
- (A) Archon-style: Up to +7 HP (massive swings, high strategy)
- (B) Moderate: +3 HP max (noticeable but not game-deciding)
- (C) Minimal: +1 HP (mostly aesthetic, skill dominates)
- **Impact:** Determines how much board position matters vs combat skill

### 5. Swarm Unit HP Model (Drones/Hawks)
**Options:**
- (A) Shared health pool — simpler, 12 HP total for the group
- (B) Separate HP per unit (3 HP each × 4) — more tactical, complex UI
- (C) Hybrid: 2 pairs of 2 units
- **Impact:** Combat complexity and UI requirements

---

## 🟡 MEDIUM PRIORITY (Affects Polish/Feel)

### 6. Shapeshifter Combat Style
**Options:**
- (A) Pure mirror match — copies stats AND attack style (perfectly fair)
- (B) Copy stats, keep original attack — more variety, slight asymmetry
- **Impact:** Skill expression vs variety

### 7. Leader Spell Differentiation
**Options:**
- (A) Keep identical (different names, same effects) — perfectly balanced
- (B) Differentiate for faction flavor — more character, balance risk
- **Impact:** Faction identity vs competitive integrity

### 8. Combat Arena Shape
**Options:**
- (A) Fixed rectangular arena (classic Archon style)
- (B) Arena shape varies by terrain type (forest = obstacles, water = open)
- (C) Hex-based arena matching strategy board aesthetic
- **Impact:** Combat variety and development complexity

---

## 🟢 LOW PRIORITY (Can Defer)

### 9. Unit Naming Convention
**Options:**
- (A) Keep current functional names (Sentinel Drone, Thornling)
- (B) Create evocative fantasy names
- (C) Use placeholder codes (T1, T2, G1, G2) until later
- **Impact:** Marketing/polish only, no gameplay effect

### 10. Board Size Flexibility
- Stick with 8×8 or plan for variable sizes (6×6 quick, 10×10 epic)?
- **Impact:** Future feature, not needed for MVP

---

## ✅ COMPLETED TASKS

- [x] GitHub authentication (`gh auth login`)
- [x] Repository created and pushed
- [x] Godot project archived, React pivot confirmed
- [x] Board prototype with 3 themes built
- [x] Executive summary written

---

## 📋 RECOMMENDED QUICK ANSWERS

For fastest progress, here's the "just pick something" defaults:

| Question | Default | Rationale |
|----------|---------|-----------|
| Theme | Fantasy Classic | Most broadly appealing |
| Pawn Count | 4 | Simpler, classic Archon feel |
| Leader Role | (A) Combat, not required | Less punishing for new players |
| Terrain Bonus | (B) +3 HP | Meaningful but not crushing |
| Swarm HP | (A) Shared pool | Simpler to implement first |
| Shapeshifter | (A) Pure mirror | Fair, defer variety |
| Spells | (A) Identical | Balance first |
| Arena | (A) Fixed rectangle | Classic, simpler |

**If you agree with defaults, just say "use defaults" and I'll proceed.**

---

*Total blocking decisions: 2*
*Total decisions: 10*
*Estimated decision time: 5-10 minutes*
