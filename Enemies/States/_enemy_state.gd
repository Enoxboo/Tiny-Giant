extends State
class_name EnemiesState

const IDLE = "Idle"
const PATROL = "Patrol"

var enemy: BaseEnemy


func _ready() -> void:
	await owner.ready
	enemy = owner as BaseEnemy
	assert(enemy != null, "The EnemyState state type must be used only in the enemy scene")
