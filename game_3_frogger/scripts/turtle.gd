extends Platform
class_name Turtle

func setupLength():
	if $Area2D:
		for child in $Area2D.get_children():
			child.queue_free()
	
	if $PlayerMover:
		$PlayerMover.clearCollisionShapes()
		
	for item in range(1,length + 1):
		var shape = $Templates/CollisionShape2D.duplicate() as CollisionShape2D
		var sprite = $Templates/AnimatedSprite2D.duplicate() as AnimatedSprite2D
		sprite.play()
			
		sprite.position = (item - 1) * tile_offset
		shape.position += (item - 1) * tile_offset 
		
		
		sprite.flip_h = flip_h
			
		$Area2D.add_child(sprite)
		$Area2D.add_child(shape)
		$PlayerMover.addCollisionShape(shape.duplicate())
