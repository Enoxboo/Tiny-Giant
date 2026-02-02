extends PlayerState


func physics_update(delta: float) -> void:
	var input_direction_x: float = Input.get_axis("move_left","move_right")
	player.velocity.x = player.data.speed * input_direction_x
	PhysicsUtils.apply_gravity(player.data.gravity, delta, player)
	player.move_and_slide()

	_check_exits(input_direction_x)


func _check_exits(input_direction_x: float) -> void:
	if not player.is_on_floor():
		finished.emit(FALLING)
		return
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
		return
	
	if Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
