@tool
extends Platform
class_name Croc

const CROC_HEAD = preload("uid://bo2rbkc73k34y")
const CROC_TAIL = preload("uid://bpdwhxermmxv3")
const CROC_BODY = preload("uid://ckxmerhn70xp7")


func setupLength():
	length = 3
	
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
				sprite.texture = CROC_TAIL
			elif item == length:
				sprite.texture = CROC_HEAD
				var killzone = $Templates/Killzone.duplicate() as Area2D
				$Area2D.add_child(killzone)
				killzone.position += (item - 3) * tile_offset
			else:
				sprite.texture = CROC_BODY
			
		else:
			sprite.flip_h = true
			if item == 1:
				sprite.texture = CROC_TAIL
				
			elif item == length:
				sprite.texture = CROC_HEAD
				var killzone = $Templates/Killzone.duplicate() as Area2D
				$Area2D.add_child(killzone)
				killzone.position += (item + 1) * tile_offset
			else:
				sprite.texture = CROC_BODY
			
		sprite.position = (item - 1) * tile_offset
		shape.position += (item - 1) * tile_offset
			
		
		
		$Area2D.add_child(sprite)
		$Area2D.add_child(shape)
		$PlayerMover.addCollisionShape(shape.duplicate())
