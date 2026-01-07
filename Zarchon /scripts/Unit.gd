## Unit.gd
## Base class for all game units (Light and Dark sides)
class_name Unit
extends Node2D

## Unit properties
@export var unit_name: String = "Unit"
@export var max_health: int = 100
@export var move_range: int = 3
@export var is_light_side: bool = true

## Combat stats
@export var base_attack: float = 10.0
@export var base_defense: float = 5.0
@export var movement_speed: float = 200.0

## Current state
var current_health: int
var current_cell: HexCell = null
var is_selected: bool = false

## Abilities
var primary_ability: String = "attack"
var secondary_ability: String = "special"

## Visual representation
@onready var sprite: Sprite2D = $Sprite2D
@onready var selection_indicator: Sprite2D = $SelectionIndicator
@onready var health_bar: ProgressBar = $HealthBar

signal unit_selected(unit: Unit)
signal unit_moved(from: HexCell, to: HexCell)
signal unit_died(unit: Unit)

func _ready() -> void:
	current_health = max_health
	if selection_indicator:
		selection_indicator.visible = false
	update_health_bar()

## Initialize unit at a hex cell
func initialize(cell: HexCell, light_side: bool) -> void:
	is_light_side = light_side
	current_cell = cell
	cell.unit = self
	position = cell.world_position
	
	# Set color tint based on side
	if sprite:
		sprite.modulate = Color.CYAN if is_light_side else Color.ORANGE_RED

## Move to target cell
func move_to_cell(target: HexCell, path: Array[HexCell]) -> void:
	if target == null or not target.is_walkable():
		return
	
	# Clear current cell
	if current_cell:
		current_cell.unit = null
	
	# Animate movement along path
	await animate_along_path(path)
	
	# Update position
	current_cell = target
	target.unit = self
	
	emit_signal("unit_moved", path[0] if path.size() > 0 else null, target)

## Animate movement along path
func animate_along_path(path: Array[HexCell]) -> void:
	for cell in path:
		var tween = create_tween()
		tween.tween_property(self, "position", cell.world_position, 0.3)
		await tween.finished

## Take damage
func take_damage(amount: float) -> void:
	current_health = maxi(0, current_health - int(amount))
	update_health_bar()
	
	if current_health <= 0:
		die()

## Heal unit
func heal(amount: int) -> void:
	current_health = mini(max_health, current_health + amount)
	update_health_bar()

## Death handling
func die() -> void:
	if current_cell:
		current_cell.unit = null
	emit_signal("unit_died", self)
	queue_free()

## Update health bar display
func update_health_bar() -> void:
	if health_bar:
		health_bar.max_value = max_health
		health_bar.value = current_health

## Select this unit
func select() -> void:
	is_selected = true
	if selection_indicator:
		selection_indicator.visible = true
	emit_signal("unit_selected", self)

## Deselect this unit
func deselect() -> void:
	is_selected = false
	if selection_indicator:
		selection_indicator.visible = false

## Get attack strength modified by terrain
func get_attack_strength() -> float:
	if current_cell == null:
		return base_attack
	
	var modifier = current_cell.get_terrain_modifier(is_light_side)
	return base_attack * modifier

## Get defense strength modified by terrain
func get_defense_strength() -> float:
	if current_cell == null:
		return base_defense
	
	var modifier = current_cell.get_terrain_modifier(is_light_side)
	return base_defense * modifier

## Check if unit can move to cell
func can_move_to(target: HexCell) -> bool:
	if target == null or not target.is_walkable():
		return false
	
	if current_cell == null:
		return false
	
	return current_cell.distance_to(target) <= move_range

## Get valid move targets
func get_valid_moves(grid: HexGrid) -> Array[HexCell]:
	var valid_cells: Array[HexCell] = []
	
	if current_cell == null:
		return valid_cells
	
	var cells_in_range = grid.get_cells_in_range(current_cell, move_range)
	for cell in cells_in_range:
		if cell.is_walkable() and cell != current_cell:
			valid_cells.append(cell)
	
	return valid_cells

## Handle input for selection (touch/click/controller)
func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		select()

## String representation
func _to_string() -> String:
	return "%s (%s) HP:%d/%d at %s" % [
		unit_name,
		"Light" if is_light_side else "Dark",
		current_health,
		max_health,
		current_cell
	]
