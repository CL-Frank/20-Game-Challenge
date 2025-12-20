extends Node2D

@export var target : Node2D
@export var offset: float = 20.0
	
func _physics_process(_delta: float) -> void:
	var screen_size = get_viewport_rect().size
	
	if target.global_position.y > screen_size.y + offset:
		target.global_position.y = 0 - offset
	elif target.global_position.y < 0  - offset:
		target.global_position.y = screen_size.y + offset
		
	elif target.global_position.x > screen_size.x + offset:
		target.global_position.x = 0 - offset
	elif target.global_position.x < 0 - offset:
		target.global_position.x = screen_size.x + offset
