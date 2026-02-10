extends PlayerState


func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.velocity.x = 0.0


func physics_update(delta: float) -> void:
	PhysicsUtils.apply_gravity(player.data.gravity, delta, player)
	player.move_and_slide()
	
	_check_exits()


func _check_exits() -> void:
	if player.is_dead:
		finished.emit(DEAD)
		return
	
	if not player.is_on_floor():
		finished.emit(FALLING)
		return
	
	if Input.is_action_just_pressed("jump"):
		finished.emit(JUMPING)
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
