extends CharacterBody2D
class_name BaseEnemy

@export var data: EnemyData
@export var patrol_points: Dictionary[int, Node2D]

var scale_modifier: float = 1.0
