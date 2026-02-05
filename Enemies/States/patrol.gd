extends EnemiesState

var current_target: int = 0
var direction: Vector2

func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	direction = (enemy.patrol_points[0].global_position - enemy.global_position)
	print(direction)

func physics_update(delta: float) -> void:
	enemy.velocity = enemy.data.speed * direction.normalized()
	PhysicsUtils.apply_gravity(enemy.data.gravity, delta, enemy)
	enemy.move_and_slide()
	
	if direction.is_zero_approx():
		on_target_reached()


func on_target_reached() -> void:
	current_target = (current_target + 1) % enemy.patrol_points.size()
