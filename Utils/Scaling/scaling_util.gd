extends Node
class_name ScalingUtils


static func change_scale(step: float, parent: CharacterBody2D) -> void:
	parent.scale_modifier += step
	
	var tween = parent.create_tween()
	tween.set_trans(Tween.TRANS_SPRING)
	tween.set_ease(Tween.EASE_OUT if step > 0.0 else Tween.EASE_IN)
	
	AudioManager.play_scale_sound(step > 0.0)
	
	var squash = Vector2(parent.scale_modifier * 1.2, parent.scale_modifier * 1.2) if step > 0.0 else Vector2(parent.scale_modifier * 0.8, parent.scale_modifier * 0.8)
	
	tween.tween_property(parent, "scale", squash, 0.1)
	tween.tween_property(parent, "scale", Vector2(parent.scale_modifier, parent.scale_modifier), 0.2)
