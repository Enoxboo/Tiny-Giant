extends Node
class_name PhysicsUtils


static func apply_gravity(gravity: float, delta: float, parent: CharacterBody2D) -> void:
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
	
