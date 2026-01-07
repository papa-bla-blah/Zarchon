## HexGrid.gd
## Manages the hexagonal grid system with pathfinding
## Implements A* pathfinding for hex grids
class_name HexGrid
extends RefCounted

## Grid storage: Dictionary[Vector2i, HexCell]
var cells: Dictionary = {}

## Grid dimensions
var width: int
var height: int

## Hex size for rendering
var hex_size: float = 64.0

## Luminosity cycle timer (for Archon Ultra mechanic)
var cycle_time: float = 0.0
var cycle_duration: float = 30.0  # 30 seconds per full cycle

func _init(grid_width: int, grid_height: int, size: float = 64.0) -> void:
	width = grid_width
	height = grid_height
	hex_size = size
	_generate_grid()

## Generate the hex grid
func _generate_grid() -> void:
	# Generate axial coordinates for rectangular grid
	# Using "odd-r" offset coordinate system
	for r in range(height):
		var r_offset = r >> 1  # Equivalent to floor(r / 2)
		for q in range(-r_offset, width - r_offset):
			var cell = HexCell.new(q, r)
			cell.world_position = cell.get_isometric_position(hex_size)
			cells[Vector2i(q, r)] = cell
	
	print("HexGrid generated: %d x %d = %d cells" % [width, height, cells.size()])

## Get cell at axial coordinates
func get_cell(q: int, r: int) -> HexCell:
	return cells.get(Vector2i(q, r), null)

## Get cell from Vector2i
func get_cell_v(coord: Vector2i) -> HexCell:
	return cells.get(coord, null)

## Get cell at world position (pixel coordinates)
func get_cell_at_position(world_pos: Vector2) -> HexCell:
	# Convert pixel position to hex coordinates
	var hex_coord = pixel_to_hex(world_pos)
	return get_cell(hex_coord.x, hex_coord.y)

## Convert pixel coordinates to hex axial coordinates
func pixel_to_hex(pos: Vector2) -> Vector2i:
	# Flat-top hexagon pixel to hex conversion
	var q = (2.0/3.0 * pos.x) / hex_size
	var r = (-1.0/3.0 * pos.x + sqrt(3.0)/3.0 * pos.y) / hex_size
	return axial_round(Vector2(q, r))

## Round fractional hex coordinates to nearest integer hex
func axial_round(hex: Vector2) -> Vector2i:
	var q = hex.x
	var r = hex.y
	var s = -q - r
	
	var q_int = roundi(q)
	var r_int = roundi(r)
	var s_int = roundi(s)
	
	var q_diff = abs(q_int - q)
	var r_diff = abs(r_int - r)
	var s_diff = abs(s_int - s)
	
	if q_diff > r_diff and q_diff > s_diff:
		q_int = -r_int - s_int
	elif r_diff > s_diff:
		r_int = -q_int - s_int
	
	return Vector2i(q_int, r_int)

## A* pathfinding from start to goal
func find_path(start: HexCell, goal: HexCell) -> Array[HexCell]:
	if start == null or goal == null:
		return []
	
	if not goal.is_walkable():
		return []
	
	var frontier: Array = []
	var came_from: Dictionary = {}
	var cost_so_far: Dictionary = {}
	
	var start_coord = Vector2i(start.q, start.r)
	var goal_coord = Vector2i(goal.q, goal.r)
	
	frontier.append([0, start])
	came_from[start_coord] = null
	cost_so_far[start_coord] = 0
	
	while frontier.size() > 0:
		# Get lowest priority item
		frontier.sort_custom(func(a, b): return a[0] < b[0])
		var current: HexCell = frontier.pop_front()[1]
		var current_coord = Vector2i(current.q, current.r)
		
		if current_coord == goal_coord:
			break
		
		# Check neighbors
		for neighbor_coord in current.get_all_neighbors():
			var neighbor = get_cell_v(neighbor_coord)
			if neighbor == null or not neighbor.is_walkable():
				continue
			
			var new_cost = cost_so_far[current_coord] + 1
			
			if neighbor_coord not in cost_so_far or new_cost < cost_so_far[neighbor_coord]:
				cost_so_far[neighbor_coord] = new_cost
				var priority = new_cost + neighbor.distance_to(goal)
				frontier.append([priority, neighbor])
				came_from[neighbor_coord] = current_coord
	
	# Reconstruct path
	if goal_coord not in came_from:
		return []
	
	var path: Array[HexCell] = []
	var current_coord = goal_coord
	
	while current_coord != null:
		path.append(get_cell_v(current_coord))
		current_coord = came_from.get(current_coord, null)
	
	path.reverse()
	return path

## Update luminosity cycle (call from _process)
func update_cycle(delta: float) -> void:
	cycle_time += delta
	if cycle_time >= cycle_duration:
		cycle_time = 0.0
	
	# Calculate luminosity (0.0 to 1.0 and back)
	var cycle_phase = cycle_time / cycle_duration
	var luminosity = abs(sin(cycle_phase * PI))
	
	# Update all cells
	for cell in cells.values():
		if cell.terrain == HexCell.TerrainType.NORMAL:
			cell.luminosity = luminosity

## Get all cells within range
func get_cells_in_range(center: HexCell, range: int) -> Array[HexCell]:
	var result: Array[HexCell] = []
	
	for cell in cells.values():
		if center.distance_to(cell) <= range:
			result.append(cell)
	
	return result

## Get ring of cells at specific distance
func get_ring(center: HexCell, radius: int) -> Array[HexCell]:
	var result: Array[HexCell] = []
	
	if radius == 0:
		return [center]
	
	for cell in cells.values():
		if center.distance_to(cell) == radius:
			result.append(cell)
	
	return result
