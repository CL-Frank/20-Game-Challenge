extends CharacterBody2D

@export var acceleration: float = 10.0
@export var rotation_speed: float = 500.0
@export var max_speed:float = 350.0

@export var laser_scene: PackedScene
@export var projectile_muzzle: Marker2D

@onready var hurt_component: HurtComponent = $HurtComponent

@export var shoot_cd: bool = false
@export var rate_of_fire:float = 0.2

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		if !shoot_cd:
			on_player_shoot()
			shoot_cd = true
			await get_tree().create_timer(rate_of_fire).timeout
			shoot_cd = false
			

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
	print("Player hit by: ", area.collision_layer)
		
func on_player_shoot() -> void:
	var laser_instance = laser_scene.instantiate()
	laser_instance.global_position = projectile_muzzle.global_position
	laser_instance.rotation = rotation
#	Add laser to own Laser node in final
	get_tree().root.add_child(laser_instance)
	
