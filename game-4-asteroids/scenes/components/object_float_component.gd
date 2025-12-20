extends Node
@export var target: Node2D

var speed:float = 3.0
var direction: Vector2
var rotation_speed: float

func _ready() -> void:
	apply_direction_and_speed()
	
func _physics_process(delta: float) -> void:
	target.position += speed * direction
	target.rotate(deg_to_rad(rotation_speed * delta))
	
func apply_direction_and_speed() -> void:
	var x_direction = randf_range(0.0, 1.0)
	var y_direction = randf_range(0.0, 1.0)
	rotation_speed = randf_range(10.0,30.0)
	
	direction = Vector2(x_direction, y_direction)
	#speed = randf_range(5.0,8.0)
