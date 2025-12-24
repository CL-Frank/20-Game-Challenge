class_name ProjectileComponent
extends Node

@export var target_projectile: Node2D
@export var speed: float = 200.0
@export var life_time: float= 5.0

@export var collision_shape_2d: CollisionShape2D
@onready var hit_component: HitComponent = $"../HitComponent"
@onready var laser_sfx: AudioStreamPlayer2D = $"../LaserSFX"

var movement_vector = Vector2(0,-1)

func _ready() -> void:
	laser_sfx.play()

func _physics_process(delta: float) -> void:
	target_projectile.global_position += movement_vector.rotated(target_projectile.rotation) * speed * delta
	await get_tree().create_timer(life_time).timeout
	target_projectile.queue_free()
