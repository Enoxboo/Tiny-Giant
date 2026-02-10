extends CharacterBody2D
class_name Player

signal scale_changed(new_scale_modifier: float)

@onready var sprite: Sprite2D = $Sprite
@onready var collision: CollisionShape2D = $Collision
@onready var spawn_point: Node2D = get_tree().get_first_node_in_group("SpawnPoint")

@export var data: PlayerData

var is_dead: bool = false
var scale_modifier: float


func _ready() -> void:
	spawn()


func _input(event: InputEvent) -> void:
	if is_dead:
		return
	
	if event.is_action_pressed("scale_up") and scale_modifier < 2.0:
		scale_modifier += 0.25
		scale_changed.emit(scale_modifier)
	elif event.is_action_pressed("scale_down") and scale_modifier > 0.25:
		scale_modifier -= 0.25
		scale_changed.emit(scale_modifier)


func spawn() -> void:
	is_dead = false
	scale_modifier = 1.0
	scale_changed.emit(scale_modifier)

	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property(sprite, "modulate", Color.WHITE, 0.3)
	tween.tween_property(sprite, "scale", Vector2(1.0, 1.0), 0.3)
	tween.tween_property(sprite, "rotation", 0, 0.3)
	
	global_position = spawn_point.global_position



func _on_scale_changed(new_scale_modifier: float) -> void:
	self.scale = Vector2(new_scale_modifier, new_scale_modifier)
