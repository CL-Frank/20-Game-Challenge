extends Node2D

@export var target : Node2D
	
func _physics_process(_delta: float) -> void:
	var screen_size = get_viewport_rect().size
	
	if target.global_position.y > screen_size.y:
		target.global_position.y = 0
	elif target.global_position.y < 0:
		target.global_position.y = screen_size.y
	elif target.global_position.x > screen_size.x:
		target.global_position.x = 0
	elif target.global_position.x < 0:
		target.global_position.x = screen_size.x
