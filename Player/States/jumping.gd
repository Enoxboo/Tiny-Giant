extends PlayerState


func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.velocity.y = -player.data.jump_force


func physics_update(delta: float) -> void:
	var input_direction_x: float = Input.get_axis("move_left","move_right")
	player.velocity.x = player.data.speed * player.scale_modifier * input_direction_x
	PhysicsUtils.apply_gravity(player.data.gravity, delta, player)
	player.move_and_slide()
	
	_check_exit()


func _check_exit() -> void:
	if player.velocity.y >= 0:
		finished.emit(FALLING)
