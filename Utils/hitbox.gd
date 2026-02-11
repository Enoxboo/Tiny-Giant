extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if not area.has_method("take_damage"):
		return
	
	area.take_damage()
