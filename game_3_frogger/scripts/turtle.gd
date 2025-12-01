
extends Platform
class_name Turtle

@export var initial_delay = 0.0
var is_safe = true
var timer = 0.0
var current_state = 0  # 0=surface, 1=warning, 2=underwater
var started = false

func _process(delta):
	timer += delta
	
	if not started:
		var delay = initial_delay if initial_delay != null else 0.0
		if timer >= delay:
			started = true
			timer = 0.0
		return
	
	match current_state:
		0:  # Surface (frame 0) - 3 seconds
			if timer >= randf_range(3,5):
				current_state = 1
				timer = 0.0
				set_frame(1)
		1:  # Warning (frame 1) - 1 second
			if timer >= 1.5:
				current_state = 2
				timer = 0.0
				set_frame(2)
				start_diving()
		2:  # Underwater (frame 2) - 2 seconds
			if timer >= randf_range(0.5,1.0):
				current_state = 0
				timer = 0.0
				set_frame(0)
				surface()

func set_frame(frame_num):
	for child in $Area2D.get_children():
		if child.has_method("play"):
			child.stop()
			child.frame = frame_num

func start_diving():
	is_safe = false
	# Disable collision shapes (player will fall off)
	for child in $Area2D.get_children():
		if child is CollisionShape2D:
			child.disabled = true

func surface():
	is_safe = true
	# Enable collision shapes
	for child in $Area2D.get_children():
		if child is CollisionShape2D:
			child.disabled = false

func setupLength():
	if $Area2D:
		for child in $Area2D.get_children():
			child.queue_free()
	
	if $PlayerMover:
		$PlayerMover.clearCollisionShapes()
		
	for item in range(1,length + 1):
		var shape = $Templates/CollisionShape2D.duplicate() as CollisionShape2D
		var sprite = $Templates/AnimatedSprite2D.duplicate() as AnimatedSprite2D
		sprite.stop()
		sprite.frame = 0
			
		sprite.position = (item - 1) * tile_offset
		shape.position += (item - 1) * tile_offset 
		
		
		sprite.flip_h = flip_h
			
		$Area2D.add_child(sprite)
		$Area2D.add_child(shape)
		$PlayerMover.addCollisionShape(shape.duplicate())
