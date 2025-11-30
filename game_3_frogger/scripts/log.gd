
extends Platform
class_name Log
const LOG_END = preload("uid://wr3bg5u5rdby")
const LOG_MIDDLE = preload("uid://llj3bsqplx1k")
const LOG_START = preload("uid://csmbjoaboh7my")
	
		
func setupLength():
	
	
	if $Area2D:
		for child in $Area2D.get_children():
			child.queue_free()
	
	if $PlayerMover:
		$PlayerMover.clearCollisionShapes()
		
	for item in range(1,length + 1):
		var sprite = $Templates/Sprite2D.duplicate() as Sprite2D
		var shape = $Templates/CollisionShape2D.duplicate() as CollisionShape2D
		
		if !flip_h:
			if item == 1:
				sprite.texture = LOG_START
			elif item == length:
				sprite.texture = LOG_END
			else:
				sprite.texture = LOG_MIDDLE
			sprite.position = (item - 1) * tile_offset
			shape.position += (item - 1) * tile_offset
		else:
			sprite.flip_h = true
			if item == 1:
				sprite.texture = LOG_START
				
			elif item == length:
				sprite.texture = LOG_END
			else:
				sprite.texture = LOG_MIDDLE
			sprite.position = -(item - 1) * tile_offset
			shape.position += -(item - 1) * tile_offset
			
		
		
		$Area2D.add_child(sprite)
		$Area2D.add_child(shape)
		$PlayerMover.addCollisionShape(shape.duplicate())
