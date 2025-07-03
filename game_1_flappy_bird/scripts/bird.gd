extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	else:
		velocity += get_gravity() * delta
	velocity.x = SPEED
	move_and_slide()

func endGame()-> void:
	print("YOU DIED")
	get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
