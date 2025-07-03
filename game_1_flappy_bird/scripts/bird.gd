extends CharacterBody2D
@onready var final_score_label: Label = $"../GameOver/FinalScoreLabel"
@onready var pipe_spawner: Node2D = $"../PipeSpawner"


#const SPEED = 250.0
const JUMP_VELOCITY = -400.0
var score = 0
var start = false

func _physics_process(delta: float) -> void:
	if !start && Input.is_action_just_pressed("jump"):
		pipe_spawner.start()
		start = true
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		print("JUMPED")
		start = true
		velocity.y = JUMP_VELOCITY
	else:
		if start:
			velocity += get_gravity() * delta
	move_and_slide()

func endGame()-> void:
	print("YOU DIED")
	$"../GameOver".show()
	final_score_label.text = "FINAL SCORE: "+ str(score)
	Engine.time_scale = 0

func _on_timer_timeout() -> void:
	pass # Replace with function body.
