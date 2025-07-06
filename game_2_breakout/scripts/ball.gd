extends CharacterBody2D
class_name Ball	
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var BallStartPos: Marker2D

var SPEED = 20.0
var SPEED_CAP = 30.0
signal life_lost
signal dead
var lives = 3
var score = 0
signal brick_destroyed
var startPos = Vector2.ZERO
var last_collider_id
var last_velocity

func _ready() -> void:
	startPos = position
func _process(delta: float) -> void:
	var input = Input.is_action_just_pressed("ui_accept")
	if input:
		startBall()

func _physics_process(delta: float) -> void:
#	Ball Collision
	var collision_info = move_and_collide( velocity * delta * SPEED)
	if !collision_info:
		return
		
	
	var collider = collision_info.get_collider()
	if collider is Brick:
		collider.destroy()
		brick_destroyed.emit()
		SPEED = min(SPEED + 0.5, SPEED_CAP)  # Cap SPEED at 30

	if collider is Paddle or collider is Brick:
		ball_collision(collider)
	else:
		velocity = velocity.bounce(collision_info.get_normal())
			

func resetBall() -> void:
	position = startPos
	velocity = Vector2.ZERO
	
func startBall() -> void:
	var launch_speed = SPEED
	if last_velocity:
		launch_speed = min(last_velocity.length(), 30)
	var angle = deg_to_rad(randf_range(-60, 60))  # random angle between -10° and 10°
	velocity = Vector2.UP.rotated(angle).normalized() * launch_speed


	
func on_life_lost() -> void:
	if lives > 0:
		life_lost.emit()
		lives -=1
		resetBall()
	else:
		dead.emit()
		queue_free()

func get_lives() -> int:
	return lives
	
func ball_collision(collider):
	var ball_center_x = global_position.x
	var collider_center_x = collider.global_position.x
	var collider_width = collider.getWidth()

	var offset = (ball_center_x - collider_center_x) / (collider_width / 2)
	offset = clamp(offset, -1, 1)

	if collider is Paddle:
		var max_bounce_angle = deg_to_rad(60)  # 60 degrees max
		var bounce_angle = offset * max_bounce_angle

		# Rotate straight up vector by bounce_angle left/right
		velocity = Vector2.UP.rotated(bounce_angle).normalized() * SPEED



	elif collider is Brick:
		print("Ball velocity:", velocity, "Speed:", velocity.length())
		
		if collider.get_rid() == last_collider_id:
			velocity = velocity.rotated(deg_to_rad(randf_range(-45, 45))).normalized() * SPEED
		else:
			last_collider_id = collider.get_rid()
			# reflect Y direction
			velocity = (Vector2(velocity.x, -velocity.y).normalized() * SPEED).limit_length(SPEED_CAP)
			last_velocity = velocity
