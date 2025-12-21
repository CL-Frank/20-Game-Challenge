class_name ScreenOffsetComponent
extends Node2D

@export var target : Node2D
@export var collision_shape_2d : CollisionShape2D
@export var offset :float = 20.0
#@onready var collision_shape_2d: CollisionShape2D = $"../HitComponent/CollisionShape2D"

func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	
	
	var screen_size = get_viewport_rect().size
	
	if target.global_position.y - offset > screen_size.y :
		target.global_position.y = 0 - offset
	elif target.global_position.y + offset < 0  :
		target.global_position.y = screen_size.y + offset
		
	elif target.global_position.x - offset > screen_size.x :
		target.global_position.x = 0 - offset
	elif target.global_position.x + offset < 0:
		target.global_position.x = screen_size.x + offset
