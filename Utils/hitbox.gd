extends Area2D

@onready var parent: CharacterBody2D = get_parent()


func _on_area_entered(area: Area2D) -> void:
	if not area.has_method("take_damage"):
		return
	
	area.take_damage(parent.data.damage)
	print(area.parent.current_hp)
