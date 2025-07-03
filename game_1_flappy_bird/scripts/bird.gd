extends CharacterBody2D
@onready var pipe_spawner: Node2D = $"../PipeSpawner"
@export var GameManager: Node2D


#const SPEED = 250.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if !GameManager.playing && Input.is_action_just_pressed("jump"):
		GameManager.startGame()

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
