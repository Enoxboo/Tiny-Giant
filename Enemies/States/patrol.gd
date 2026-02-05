extends EnemiesState

var current_target: int = 0


func physics_update(delta: float) -> void:
	var direction: Vector2 = (enemy.patrol_points[current_target].global_position - enemy.global_position)
	enemy.velocity = enemy.data.speed * direction.normalized()
	PhysicsUtils.apply_gravity(enemy.data.gravity, delta, enemy)
	enemy.move_and_slide()
	
	if direction.x < 1.0 and direction.x > -1.0:
		on_target_reached()


func on_target_reached() -> void:
	current_target = (current_target + 1) % enemy.patrol_points.size()
