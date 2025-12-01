extends Area2D

var moving = false
var can_move = true
@onready var ray = $RayCast2D
@onready var sprite = $AnimatedSprite2D

@export var respawn_location:Marker2D
signal player_died

func _ready():
	position = position.snapped(Vector2.ONE * 16) + Vector2.ONE * 8

func _physics_process(_delta):
	if moving || !can_move:
		return
	
	var dir = Vector2.ZERO
	if Input.is_action_pressed("up"): dir = Vector2.UP
	elif Input.is_action_pressed("down"): dir = Vector2.DOWN
	elif Input.is_action_pressed("left"): dir = Vector2.LEFT
	elif Input.is_action_pressed("right"): dir = Vector2.RIGHT
	
	if dir != Vector2.ZERO:
		move_player(dir)

func move_player(dir):
	ray.target_position = dir * 16
	ray.force_raycast_update()
	
	if !ray.is_colliding():
		sprite.rotation = dir.angle() + PI/2
		sprite.play("jump")
		position += dir * 16
		moving = true
		$JumpSound.play()
		await get_tree().create_timer(0.3).timeout
		sprite.stop()
		moving = false
		
func died():
	print("PLAYER DIED")
	can_move = false
	$BloodSplatter.emitting = true
	$DieSound.play()
	$AnimatedSprite2D.visible = false
	await $BloodSplatter.finished
	player_died.emit()
	
	
	
func respawn():
	position = respawn_location.position
	position = position.snapped(Vector2.ONE * 16) + Vector2.ONE * 8
	$AnimatedSprite2D.visible = true
	can_move = true
	


func _on_damage_source_detector_area_entered(_area: Area2D) -> void:
	died()


func _on_drowning_detector_drowned() -> void:
	died()
