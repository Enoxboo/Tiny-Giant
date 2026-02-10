extends PlayerState


func physics_update(delta: float) -> void:
	super.physics_update(delta)
	var input_direction_x: float = Input.get_axis("move_left","move_right")
	player.velocity.x = player.data.air_speed * player.scale_modifier * input_direction_x
	PhysicsUtils.apply_gravity(player.data.gravity, delta, player)
	player.move_and_slide()

	_check_exits(input_direction_x)


func _check_exits(input_direction_x: float) -> void:
	if player.is_dead:
		finished.emit(DEAD)
		return
	
	if not player.is_on_floor():
		return
	
	if is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
	else:
		finished.emit(RUNNING)
