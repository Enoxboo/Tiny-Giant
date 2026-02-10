extends PlayerState


func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.velocity.x = 0.0
	
	var tween = player.create_tween()
	tween.set_parallel()
	tween.tween_property(player.sprite, "modulate", Color.RED, 0.5)
	tween.tween_property(player.sprite, "scale", Vector2(), 0.5)
	tween.tween_property(player.sprite, "rotation", 360, 0.5)
	
	await tween.finished
	player.spawn()
	finished.emit(IDLE)


func physics_update(delta: float) -> void:
	PhysicsUtils.apply_gravity(player.data.gravity, delta, player)
	player.move_and_slide()
