extends CharacterBody2D
class_name BaseEnemy

@export var data: EnemyData
@export var patrol_points: Dictionary[int, Node2D]

func _process(delta: float) -> void:
	print(global_position)
