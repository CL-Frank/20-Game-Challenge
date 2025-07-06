extends RigidBody2D
class_name Brick
signal destroyed
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func destroy() -> void:
	destroyed.emit()
	queue_free()

func get_size()->Vector2:
	return collision_shape_2d.shape.get_rect().size 
	
func set_postion(pos:Vector2):
	position = pos
func getWidth():
	return get_size().x
