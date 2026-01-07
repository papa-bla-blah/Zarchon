## Board.gd
## Main game board controller - handles strategic phase
## Manages hex grid, units, and turn-based movement
extends Node2D

## Board configuration
@export var grid_width: int = 3  # Start with 3x3 MVP
@export var grid_height: int = 3
@export var hex_size: float = 64.0

## Game state
enum GameState { PLAYER_TURN, AI_TURN, COMBAT, GAME_OVER }
var current_state: GameState = GameState.PLAYER_TURN

## Grid and units
var hex_grid: HexGrid
var selected_unit: Unit = null
var valid_moves: Array[HexCell] = []

## Unit references
var light_units: Array[Unit] = []
var dark_units: Array[Unit] = []

## Visual elements
@onready var camera: Camera2D = $Camera2D
@onready var hex_tile_scene = preload("res://scenes/HexTile.tscn")
@onready var unit_scene = preload("res://scenes/Unit.tscn")

## UI signals
signal combat_initiated(attacker: Unit, defender: Unit, battlefield: HexCell)
signal turn_changed(is_light_turn: bool)

func _ready() -> void:
	# Initialize grid
	hex_grid = HexGrid.new(grid_width, grid_height, hex_size)
	
	# Create visual hex tiles
	_create_hex_tiles()
	
	# Spawn initial units (MVP: 2 per side)
	_spawn_initial_units()
	
	# Center camera
	_center_camera()
	
	print("Board initialized: %dx%d grid" % [grid_width, grid_height])

func _process(delta: float) -> void:
	# Update luminosity cycle
	hex_grid.update_cycle(delta)

## Create visual hex tiles
func _create_hex_tiles() -> void:
	for cell in hex_grid.cells.values():
		var hex_tile = _create_simple_hex_visual(cell)
		add_child(hex_tile)

## Create simple hex visual (placeholder until we add proper tiles)
func _create_simple_hex_visual(cell: HexCell) -> Polygon2D:
	var hex = Polygon2D.new()
	hex.position = cell.world_position
	
	# Create hexagon points (flat-top)
	var points = PackedVector2Array()
	for i in range(6):
		var angle = PI / 3.0 * i
		var x = hex_size * 0.9 * cos(angle)
		var y = hex_size * 0.9 * sin(angle)
		points.append(Vector2(x, y))
	
	hex.polygon = points
	hex.color = _get_terrain_color(cell)
	
	# Add outline
	var line = Line2D.new()
	for point in points:
		line.add_point(point)
	line.add_point(points[0])  # Close the loop
	line.width = 2
	line.default_color = Color.BLACK
	hex.add_child(line)
	
	return hex

## Get color based on terrain and luminosity
func _get_terrain_color(cell: HexCell) -> Color:
	match cell.terrain:
		HexCell.TerrainType.LIGHT:
			return Color.LIGHT_YELLOW
		HexCell.TerrainType.DARK:
			return Color.DARK_SLATE_GRAY
		HexCell.TerrainType.POWER_POINT:
			return Color.PURPLE
		_:
			# Blend based on luminosity
			var light_color = Color(0.8, 0.9, 0.7)
			var dark_color = Color(0.4, 0.5, 0.3)
			return light_color.lerp(dark_color, cell.luminosity)

## Spawn initial units for MVP (2 per side)
func _spawn_initial_units() -> void:
	# Get corner cells for starting positions
	var light_start_1 = hex_grid.get_cell(0, 0)
	var light_start_2 = hex_grid.get_cell(1, 0)
	var dark_start_1 = hex_grid.get_cell(grid_width - 2, grid_height - 1)
	var dark_start_2 = hex_grid.get_cell(grid_width - 1, grid_height - 1)
	
	# Spawn light units
	var light_1 = _create_unit("Knight", true)
	light_1.initialize(light_start_1, true)
	light_units.append(light_1)
	add_child(light_1)
	
	var light_2 = _create_unit("Archer", true)
	light_2.initialize(light_start_2, true)
	light_units.append(light_2)
	add_child(light_2)
	
	# Spawn dark units
	var dark_1 = _create_unit("Goblin", false)
	dark_1.initialize(dark_start_1, false)
	dark_units.append(dark_1)
	add_child(dark_1)
	
	var dark_2 = _create_unit("Troll", false)
	dark_2.initialize(dark_start_2, false)
	dark_units.append(dark_2)
	add_child(dark_2)
	
	print("Units spawned: %d Light, %d Dark" % [light_units.size(), dark_units.size()])

## Create a unit (simple factory)
func _create_unit(type: String, is_light: bool) -> Unit:
	var unit = Unit.new()
	unit.unit_name = type
	unit.is_light_side = is_light
	
	# Create simple visual representation
	var sprite = Sprite2D.new()
	sprite.name = "Sprite2D"
	var circle = _create_circle_texture(32, Color.CYAN if is_light else Color.ORANGE_RED)
	sprite.texture = circle
	unit.add_child(sprite)
	
	# Add selection indicator
	var indicator = Sprite2D.new()
	indicator.name = "SelectionIndicator"
	var ring = _create_ring_texture(40, Color.YELLOW)
	indicator.texture = ring
	indicator.visible = false
	unit.add_child(indicator)
	
	# Connect signals
	unit.unit_selected.connect(_on_unit_selected)
	
	return unit

## Create simple circle texture
func _create_circle_texture(radius: int, color: Color) -> ImageTexture:
	var img = Image.create(radius * 2, radius * 2, false, Image.FORMAT_RGBA8)
	for x in range(radius * 2):
		for y in range(radius * 2):
			var dx = x - radius
			var dy = y - radius
			if dx * dx + dy * dy <= radius * radius:
				img.set_pixel(x, y, color)
	return ImageTexture.create_from_image(img)

## Create ring texture
func _create_ring_texture(radius: int, color: Color) -> ImageTexture:
	var img = Image.create(radius * 2, radius * 2, false, Image.FORMAT_RGBA8)
	for x in range(radius * 2):
		for y in range(radius * 2):
			var dx = x - radius
			var dy = y - radius
			var dist_sq = dx * dx + dy * dy
			if dist_sq <= radius * radius and dist_sq >= (radius - 4) * (radius - 4):
				img.set_pixel(x, y, color)
	return ImageTexture.create_from_image(img)

## Center camera on board
func _center_camera() -> void:
	if camera:
		var center_cell = hex_grid.get_cell(grid_width / 2, grid_height / 2)
		if center_cell:
			camera.position = center_cell.world_position

## Handle unit selection
func _on_unit_selected(unit: Unit) -> void:
	# Deselect previous unit
	if selected_unit:
		selected_unit.deselect()
		_clear_valid_moves()
	
	# Select new unit
	selected_unit = unit
	valid_moves = unit.get_valid_moves(hex_grid)
	_show_valid_moves()
	
	print("Selected: %s" % unit)

## Show valid move highlights
func _show_valid_moves() -> void:
	for cell in valid_moves:
		# Add visual highlight (placeholder)
		pass

## Clear valid move highlights
func _clear_valid_moves() -> void:
	valid_moves.clear()

## Handle input for board interaction
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var clicked_cell = hex_grid.get_cell_at_position(get_global_mouse_position())
		if clicked_cell:
			_handle_cell_click(clicked_cell)

## Handle hex cell click
func _handle_cell_click(cell: HexCell) -> void:
	if selected_unit == null:
		# Try to select unit at this cell
		if cell.unit:
			_on_unit_selected(cell.unit)
	else:
		# Try to move selected unit
		if cell in valid_moves:
			var path = hex_grid.find_path(selected_unit.current_cell, cell)
			if path.size() > 0:
				selected_unit.move_to_cell(cell, path)
				selected_unit.deselect()
				selected_unit = null
				_clear_valid_moves()
		elif cell.unit and cell.unit != selected_unit:
			# Initiate combat
			emit_signal("combat_initiated", selected_unit, cell.unit, cell)
			print("Combat: %s vs %s" % [selected_unit.unit_name, cell.unit.unit_name])
