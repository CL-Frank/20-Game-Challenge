extends CharacterBody2D

@export var acceleration: float = 10.0
@export var rotation_speed: float = 500.0
@export var max_speed:float = 350.0

@onready var hurt_component: HurtComponent = $HurtComponent

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)

func _physics_process(delta: float) -> void:
	
	var input_vector := Vector2(0, Input.get_axis("forward", "backward"))
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("rotate_right"):
		rotate(rad_to_deg(-rotation_speed * delta))
	elif Input.is_action_pressed("rotate_left"):
		rotate(rad_to_deg(rotation_speed * delta))
	
	move_and_slide()
	
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	
func on_hurt(area: Area2D) -> void:
	print("Player hit by: ", area.name)
		
