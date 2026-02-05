extends Area2D

@onready var parent: CharacterBody2D = get_parent()
var invicibilty_time: float = 1.2


func take_damage(damage: int):
	if damage < 1:
		return
	
	set_deferred("monitorable", false)
	parent.current_hp -= damage
	if parent.current_hp <= 0:
		print("dead")
	
	var tween = parent.create_tween()
	tween.set_loops(3)
	tween.tween_property(parent.sprite, "modulate", Color.RED, 0.2)
	tween.tween_property(parent.sprite, "modulate", Color.WHITE, 0.2)

	await get_tree().create_timer(invicibilty_time).timeout
	set_deferred("monitorable", true)
