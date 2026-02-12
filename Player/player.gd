extends CharacterBody2D
class_name Player

signal scale_changed(step: float)

const SCALE_STEP: float = 0.25
const MAX_SCALE: float = 2.0
const MIN_SCALE: float = 0.25

@onready var sprite: Sprite2D = $Sprite
@onready var spawn_point: Node2D = get_tree().get_first_node_in_group("SpawnPoint")

@export var data: PlayerData

var is_dead: bool = false
var scale_modifier: float


func _ready() -> void:
	spawn()


func _input(event: InputEvent) -> void:
	if is_dead:
		return
	
	if event.is_action_pressed("scale_up") and scale_modifier < MAX_SCALE:
		scale_changed.emit(SCALE_STEP)
	elif event.is_action_pressed("scale_down") and scale_modifier > MIN_SCALE:
		scale_changed.emit(-SCALE_STEP)


func spawn() -> void:
	is_dead = false
	scale_modifier = 1.0
	scale_changed.emit(0)

	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(sprite, "modulate", Color.WHITE, 0.3)
	tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.3)
	tween.tween_property(sprite, "rotation", 0, 0.3)
	
	global_position = spawn_point.global_position


func _on_scale_changed(step: float) -> void:
	ScalingUtils.change_scale(step, self)
