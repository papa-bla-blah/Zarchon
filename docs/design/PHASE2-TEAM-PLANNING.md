# ZARCHON PHASE 2: TEAM PLANNING DOCUMENT
## Asymmetric Faction Design for Balanced Competitive Play

---

## EXECUTIVE SUMMARY

This document outlines the complete unit roster for both Zarchon factions:
- **THE ASCENDANCY** (Technocracy/Sci-Fi faction)
- **GAIA'S CHOSEN** (Earth/Nature faction)

Each team follows Archon's proven structure:
- 4+ "Pawn" units (expendable, weak, but tactically useful)
- 2-3 "Pairs" of specialized units (different abilities, balanced power)
- 1 Leader unit (spellcaster/special abilities)
- 1-2 Elite units (powerful, unique mechanics)

**Design Philosophy:** Asymmetric abilities, symmetric overall power. Neither faction should have a clear advantage—victory comes from skill, not faction selection.

---

## RESEARCH-BASED DESIGN PRINCIPLES

### From Archon Analysis:
| Archon Concept | Zarchon Application |
|----------------|---------------------|
| Light vs Dark tile bonus | Terrain affinity (Tech gains on metallic/energy tiles, Gaia gains on organic/natural tiles) |
| Pawns (Knight/Goblin) | 4 cheap units, melee-focused, high skill ceiling |
| Counterpart pairs | Units with mirrored stats but different attack styles |
| Shapeshifter mechanic | "Adaptive" unit that copies opponent abilities |
| Phoenix area-of-effect | Close-range continuous damage aura |
| Djinni/Dragon as powerhouses | Elite units with highest stats but weaknesses |
| Wizard/Sorceress spells | Leader with board-wide special abilities |

### Balance Constraints:
1. **Total Team Power Budget:** Both teams score ~100 "power points" when all stats weighted
2. **Counter Web:** Every unit has 2+ favorable matchups and 2+ unfavorable matchups
3. **No Uncounterable Abilities:** Each special power has a clear counterplay
4. **Skill > Stats:** Combat outcome depends more on player skill than raw numbers

---

## INPUT CONTROL BALANCE (Critical for Cross-Platform)

### Combat Arena Design Rules:
| Element | Touch-Friendly Implementation |
|---------|-------------------------------|
| Movement | Relative to unit, not absolute screen position |
| Targeting | Auto-aim assist (adjustable by platform) |
| Attack timing | Generous input windows (200-300ms) |
| Dodge/Defense | Hold-based, not precise timing |
| Special abilities | Single tap activation, cooldown-based |

### Attack Type Categories (All Platforms Equal):
1. **Projectile (Guided):** Missile/bolt that tracks target—aim direction, fire, projectile homes slightly
2. **Projectile (Straight):** Fast, no tracking—requires prediction, high skill ceiling
3. **Area-of-Effect (AOE):** Cone/circle around unit—positioning matters, not aiming
4. **Continuous Beam:** Hold to damage—range management, no precision aim
5. **Melee:** Close range burst—about positioning, not precision clicks

---

## FACTION 1: THE ASCENDANCY (Technocracy)

*"Through logic and innovation, we shall inherit the cosmos."*

**Visual Theme:** Chrome, holographic displays, blue/white energy, geometric precision
**Terrain Affinity:** Metal/Energy tiles (+HP bonus)
**Weakness Terrain:** Organic/Water tiles (-HP penalty)

### COMPLETE UNIT ROSTER

#### PAWNS (×4): SENTINEL DRONES
| Stat | Value | Notes |
|------|-------|-------|
| **Name** | Sentinel | Mass-produced security unit |
| **Count** | 4 per team | Expendable, tactical fodder |
| **HP** | 5 | Lowest tier |
| **Move** | Ground 3 | Cannot fly |
| **Speed** | High | Quick movement in combat |
| **Primary Attack** | Pulse Pistol | Straight projectile, fast fire rate |
| **Secondary** | Energy Shield | Brief invulnerability (2 sec cooldown) |
| **Damage** | 5 | Low |
| **Special Trait** | Squad Link | If another Sentinel within 2 hexes, +1 damage |

**Combat Role:** Harassers, objective capturers, sacrifice units. Shield makes them surprisingly durable in skilled hands.

---

#### PAIR 1: ASSAULT CLASS

##### Unit A: AEGIS MECH
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 14 | Tank class |
| **Move** | Ground 3 | Slow but heavy |
| **Speed** | Low | Deliberate movement |
| **Primary Attack** | Autocannon | Straight projectile, high damage, slow fire |
| **Secondary** | Barrier Deploy | Creates temporary cover obstacle |
| **Damage** | 10 | High |
| **Special Trait** | Fortify | Standing still for 2 sec grants +3 HP shield |

**Combat Role:** Defensive anchor. Excels at holding positions, weak against fast flankers.

##### Unit B: STRIKER MECH  
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 9 | Glass cannon |
| **Move** | Ground 4 | Faster than Aegis |
| **Speed** | Moderate | Balanced |
| **Primary Attack** | Plasma Launcher | Guided missile, moderate tracking |
| **Secondary** | Rocket Boost | Short dash, passes through obstacles |
| **Damage** | 8 | Moderate-high |
| **Special Trait** | Target Lock | Hitting same enemy twice in 3 sec = bonus damage |

**Combat Role:** Aggressive damage dealer. High risk/reward. Counters slow units, weak to AOE.

---

#### PAIR 2: SPECIALIST CLASS

##### Unit A: NANO SWARM (Shapeshifter Equivalent)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | Copies opponent | Mirror mechanic |
| **Move** | Fly 5 | Highest mobility |
| **Speed** | Copies opponent | Adapts to target |
| **Primary Attack** | Copies opponent | Becomes mirror match |
| **Secondary** | Disperse | Become briefly invulnerable + move (escape tool) |
| **Damage** | Copies opponent | Fair fight guaranteed |
| **Special Trait** | Adaptive Core | Takes form of enemy when combat begins |

**Combat Role:** Equalizer unit. Forces skill-based combat. Can defeat any unit if piloted better.

##### Unit B: TECH PRIEST (Wizard Equivalent - LEADER)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 10 | Moderate |
| **Move** | Teleport 3 | Ignores obstacles |
| **Speed** | Moderate | Balanced |
| **Primary Attack** | Ion Beam | Continuous damage beam |
| **Secondary** | Hack Protocol | Disables enemy secondary for 4 sec |
| **Damage** | 8 | Moderate |
| **Spells** | See Spell List | 7 uses total, once per spell |

**Combat Role:** Strategic flexibility through spells. Moderate combat strength. High-value target.

---

#### PAIR 3: AERIAL CLASS

##### Unit A: RECON DRONE SQUAD (×4 in one "unit")
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 3 per drone (12 total) | Distributed HP |
| **Move** | Fly 4 | Aerial mobility |
| **Speed** | Very High | Fastest unit |
| **Primary Attack** | Micro-Missiles | 4 separate guided projectiles |
| **Secondary** | Scatter | Drones spread out, harder to hit |
| **Damage** | 2 per drone | Low individual, high combined |
| **Special Trait** | Swarm Targeting | All 4 can attack different angles |

**Combat Role:** Harassment and chip damage. Excellent against slow units. Weak to AOE.

##### Unit B: GUNSHIP (Dragon Equivalent)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 16 | Highest HP |
| **Move** | Fly 4 | Aerial mobility |
| **Speed** | Low | Heavy unit |
| **Primary Attack** | Heavy Laser | Straight beam, devastating damage |
| **Secondary** | Carpet Bomb | AOE attack below unit (ground targets) |
| **Damage** | 11 | Highest damage |
| **Special Trait** | Slow Recharge | Longest attack cooldown in game |

**Combat Role:** Ultimate offensive unit. Dominates open fights. Vulnerable to fast units during recharge.

---

### TECH PRIEST SPELL LIST (7 Total Uses)
| Spell | Effect |
|-------|--------|
| **Teleport** | Move any friendly unit to any empty hex |
| **EMP Pulse** | Disable enemy unit for 1 turn (cannot move) |
| **Repair Nanites** | Fully heal one friendly unit |
| **Resurrect** | Bring back one destroyed unit at 50% HP |
| **System Override** | Swap positions of two units (friend or foe) |
| **Scramble** | Reverse luminosity cycle direction |
| **Deploy Turret** | Place immobile turret (5 HP, 4 damage) on empty hex |

---

## FACTION 2: GAIA'S CHOSEN (Earth/Nature)

*"The planet remembers. The planet protects. The planet avenges."*

**Visual Theme:** Organic forms, earth tones, green/brown/amber, flowing natural shapes
**Terrain Affinity:** Organic/Water tiles (+HP bonus)
**Weakness Terrain:** Metal/Energy tiles (-HP penalty)

### COMPLETE UNIT ROSTER

#### PAWNS (×4): THORNLINGS
| Stat | Value | Notes |
|------|-------|-------|
| **Name** | Thornling | Animated plant warriors |
| **Count** | 4 per team | Expendable, regenerating |
| **HP** | 5 | Lowest tier |
| **Move** | Ground 3 | Cannot fly |
| **Speed** | Moderate | Slightly slower than Sentinel |
| **Primary Attack** | Thorn Spray | Short cone AOE, fast fire |
| **Secondary** | Root Snare | Slows enemy movement 50% for 2 sec |
| **Damage** | 5 | Low |
| **Special Trait** | Regeneration | Recovers 1 HP every 5 seconds in combat |

**Combat Role:** Zone control with slows. Regeneration rewards patient play.

---

#### PAIR 1: BEAST CLASS

##### Unit A: STONE GUARDIAN (Golem Equivalent)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 15 | Tank class |
| **Move** | Ground 3 | Slow, heavy |
| **Speed** | Very Low | Slowest unit |
| **Primary Attack** | Boulder Throw | Slow projectile, massive damage |
| **Secondary** | Earthquake Stomp | AOE around self, knocks back enemies |
| **Damage** | 10 | High |
| **Special Trait** | Stone Form | Cannot attack, but takes 50% damage (toggle) |

**Combat Role:** Immovable defender. Earthquake counters melee attackers. Weak to kiting.

##### Unit B: STALKER BEAST (Basilisk Equivalent)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 6 | Low |
| **Move** | Ground 4 | Fast ground unit |
| **Speed** | Very High | Fastest ground unit |
| **Primary Attack** | Venom Spit | Fast projectile, moderate damage |
| **Secondary** | Petrifying Gaze | Enemy cannot attack for 2 sec (must face target) |
| **Damage** | 9 | High |
| **Special Trait** | Ambush | First attack from stealth does +50% damage |

**Combat Role:** Assassin. Petrify-then-attack combo. Vulnerable once exposed.

---

#### PAIR 2: SPECIALIST CLASS

##### Unit A: MIMIC ELEMENTAL (Shapeshifter Equivalent)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | Copies opponent | Mirror mechanic |
| **Move** | Fly 5 | Highest mobility |
| **Speed** | Copies opponent | Adapts to target |
| **Primary Attack** | Copies opponent | Becomes mirror match |
| **Secondary** | Phase Shift | Become briefly invulnerable + heal 2 HP |
| **Damage** | Copies opponent | Fair fight guaranteed |
| **Special Trait** | Primal Echo | Takes form of enemy when combat begins |

**Combat Role:** Identical to Nano Swarm. Ensures mirror matchups are skill-based.

##### Unit B: EARTH SHAMAN (Sorceress Equivalent - LEADER)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 10 | Moderate |
| **Move** | Teleport 3 | Spirit walk |
| **Speed** | Moderate | Balanced |
| **Primary Attack** | Lightning Bolt | Guided projectile, chains to nearby enemies |
| **Secondary** | Nature's Wrath | AOE vines around self, continuous damage |
| **Damage** | 9 | Moderate-high |
| **Spells** | See Spell List | 7 uses total, once per spell |

**Combat Role:** Slightly more combat-oriented than Tech Priest.

---

#### PAIR 3: AERIAL CLASS

##### Unit A: STORM HAWKS (×4 in one "unit")
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 3 per hawk (12 total) | Distributed HP |
| **Move** | Fly 4 | Aerial mobility |
| **Speed** | Very High | Fastest unit |
| **Primary Attack** | Diving Strike | Melee swoop, each hawk attacks |
| **Secondary** | Updraft | All hawks gain brief invulnerability during ascent |
| **Damage** | 3 per hawk | Low individual, high combined |
| **Special Trait** | Talon Grab | Can move enemy 1 hex after successful attack |

**Combat Role:** Disruption and repositioning. Talon Grab creates strategic opportunities.

##### Unit B: ANCIENT WYRM (Dragon Equivalent)
| Stat | Value | Notes |
|------|-------|-------|
| **HP** | 16 | Highest HP |
| **Move** | Fly 4 | Aerial mobility |
| **Speed** | Low | Massive creature |
| **Primary Attack** | Breath of Ages | Cone AOE, damage over time |
| **Secondary** | Tail Sweep | Wide melee arc behind unit |
| **Damage** | 10 | High (+ DOT) |
| **Special Trait** | Ancient Scales | Immune to status effects (stun, slow, etc.) |

**Combat Role:** AOE dominance. DOT rewards sustained combat.

---

### EARTH SHAMAN SPELL LIST (7 Total Uses)
| Spell | Effect |
|-------|--------|
| **Nature's Path** | Move any friendly unit to any empty hex |
| **Entangle** | Root enemy unit for 1 turn (cannot move) |
| **Healing Spring** | Fully heal one friendly unit |
| **Rebirth** | Bring back one destroyed unit at 50% HP |
| **Earthquake** | Swap positions of two units (friend or foe) |
| **Tide Shift** | Reverse luminosity cycle direction |
| **Summon Elemental** | Summon temporary combat unit (random element) |

---

## COMPARATIVE BALANCE ANALYSIS

### Power Budget Calculation
| Category | Ascendancy | Gaia's Chosen |
|----------|------------|---------------|
| Total HP Pool | 95 | 95 |
| Average Damage | 7.1 | 7.3 |
| Average Speed | 6.2 | 5.8 |
| Mobility (Flyers) | 3 units | 3 units |
| AOE Capability | Moderate | High |
| Single Target | High | Moderate |
| Defensive Options | Shield/Barrier | Regen/Stone Form |

---

## OPEN DESIGN QUESTIONS

1. **Pawn Count:** Exactly 4, or 5-6 for more tactical options?
2. **Leader Role:** Combat unit, or required for victory (like Chess king)?
3. **Drone/Hawk HP:** Shared pool (simple) or separate per unit (tactical)?
4. **Spell Variation:** Keep identical for balance, or differentiate for flavor?
5. **Terrain Bonus:** +7 HP (Archon), +3 HP (moderate), or +1 HP (minimal)?
6. **Shapeshifter Twist:** Pure mirror, or keep original attack style?
7. **Combat Arena:** Fixed rectangle, variable by terrain, or hex-based?

---

*Document Version: 1.0*
*Last Updated: January 2026*
