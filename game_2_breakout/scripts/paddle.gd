extends CharacterBody2D
class_name Paddle
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const SPEED = 400.0


func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = (direction * SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func getWidth():
	return collision_shape_2d.shape.get_rect().size.x
