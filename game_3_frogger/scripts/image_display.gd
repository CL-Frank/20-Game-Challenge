extends Node2D
class_name  Image_Display

@export var texture:Texture2D
@export var texture_offset:Vector2 = Vector2(16,0)

@export var initial_value:int = 2
var current_value = 4

signal value_changed(value:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_value = initial_value
	displayValue()
	
func displayValue():
	for item in get_children():
		item.queue_free()
		
	for item in range(1,current_value + 1):
		var sprite = Sprite2D.new()
		sprite.texture = texture
		sprite.position = (item - 1) * texture_offset
		add_child(sprite)
		
func incrementValue(value):
	current_value += value
	value_changed.emit(current_value)
	displayValue()
	
func decrementValue(value):
	current_value -= value
	value_changed.emit(current_value)
	displayValue()
