extends CharacterBody2D
class_name Player

signal scale_changed(new_scale_modifier: float)

@onready var sprite: Sprite2D = $Sprite

@export var data: PlayerData

@onready var current_hp: int = data.max_hp
var scale_modifier: float = 1.0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enlarge") and scale_modifier < 2.0:
		scale_modifier += 0.2
		scale_changed.emit(scale_modifier)
	elif event.is_action_pressed("shrink") and scale_modifier > 0.2:
		scale_modifier -= 0.2
		scale_changed.emit(scale_modifier)


func _on_scale_changed(new_scale_modifier: float) -> void:
	self.scale = Vector2(new_scale_modifier, new_scale_modifier)
