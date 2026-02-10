extends Area2D

@onready var parent: Player = get_parent()


func take_damage():
	parent.is_dead = true
