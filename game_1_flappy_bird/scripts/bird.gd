extends CharacterBody2D
@onready var pipe_spawner: Node2D = $"../PipeSpawner"
@export var GameManager: Node2D


#const SPEED = 250.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if !GameManager.playing && GameManager.alive && Input.is_action_just_pressed("jump"):
		GameManager.startGame()
	elif !GameManager.alive && Input.is_action_just_pressed("jump"):
		get_tree().reload_current_scene()
		Engine.time_scale = 1
 
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	else:
		if GameManager.playing:
			velocity += get_gravity() * delta
	move_and_slide()

func endGame()-> void:
	GameManager.endGame()
	
func _on_timer_timeout() -> void:
	pass # Replace with function body.
