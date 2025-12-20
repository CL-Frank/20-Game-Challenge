extends Node

@export var target_projectile: Node2D
@export var speed: float = 200.0
@export var life_time: float= 5.0

var movement_vector = Vector2(0,-1)

func _physics_process(delta: float) -> void:
	target_projectile.global_position += movement_vector.rotated(target_projectile.rotation) * speed * delta
	await get_tree().create_timer(life_time).timeout
	target_projectile.queue_free()
