extends VisibleOnScreenNotifier2D
class_name VisibilityOffset2D

@export var target:Node2D
@export var offset_amount:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.screen_exited.connect(move_offset)
	
func move_offset():
	target.position += offset_amount
