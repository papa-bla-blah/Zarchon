## HexCell.gd
## Represents a single hexagonal cell using axial coordinates
## Based on Red Blob Games hex grid implementation
class_name HexCell
extends RefCounted

## Axial coordinates (q, r)
var q: int
var r: int

## Derived cube coordinate
var s: int:
	get:
		return -q - r

## World position (pixel coordinates)
var world_position: Vector2

## Terrain type
enum TerrainType {
	NORMAL,
	LIGHT,      # Favors light units
	DARK,       # Favors dark units
	POWER_POINT # Special hex
}
var terrain: TerrainType = TerrainType.NORMAL

## Luminosity cycle state (0.0 = dark, 1.0 = light)
var luminosity: float = 0.5

## Occupying unit (null if empty)
var unit = null

## Hex directions (flat-top orientation for isometric)
const DIRECTIONS = [
	Vector2i(1, 0),   # East
	Vector2i(1, -1),  # Northeast
	Vector2i(0, -1),  # Northwest
	Vector2i(-1, 0),  # West
	Vector2i(-1, 1),  # Southwest
	Vector2i(0, 1)    # Southeast
]

func _init(q_pos: int, r_pos: int) -> void:
	q = q_pos
	r = r_pos

## Get neighbor in given direction (0-5)
func get_neighbor(direction: int) -> Vector2i:
	var dir = DIRECTIONS[direction % 6]
	return Vector2i(q + dir.x, r + dir.y)

## Get all neighbor coordinates
func get_all_neighbors() -> Array[Vector2i]:
	var neighbors: Array[Vector2i] = []
	for dir in DIRECTIONS:
		neighbors.append(Vector2i(q + dir.x, r + dir.y))
	return neighbors

## Distance to another hex (in hex steps)
func distance_to(other: HexCell) -> int:
	return (abs(q - other.q) + abs(r - other.r) + abs(s - other.s)) / 2

## Convert axial to cube coordinates
func to_cube() -> Vector3i:
	return Vector3i(q, r, s)

## Get display position for isometric view
func get_isometric_position(hex_size: float = 64.0) -> Vector2:
	# Flat-top hexagon isometric projection
	var x = hex_size * (3.0/2.0 * q)
	var y = hex_size * (sqrt(3.0)/2.0 * q + sqrt(3.0) * r)
	return Vector2(x, y)

## Check if this hex is walkable
func is_walkable() -> bool:
	return unit == null

## Apply luminosity effect to unit strength
func get_terrain_modifier(is_light_unit: bool) -> float:
	match terrain:
		TerrainType.LIGHT:
			return 1.2 if is_light_unit else 0.8
		TerrainType.DARK:
			return 0.8 if is_light_unit else 1.2
		TerrainType.POWER_POINT:
			return 1.5
		_:
			# Normal terrain affected by luminosity
			if is_light_unit:
				return 0.8 + (luminosity * 0.4)  # 0.8 to 1.2
			else:
				return 1.2 - (luminosity * 0.4)  # 1.2 to 0.8

## String representation for debugging
func _to_string() -> String:
	return "HexCell(%d, %d, %d)" % [q, r, s]
