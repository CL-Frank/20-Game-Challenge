extends Vehicle
class_name Racer
enum color {Blue, Yellow}
var Sprite_Color: color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.region_enabled = true
	setColor(Sprite_Color)
	pass # Replace with function body.

func setColor(new_color:color):
	match new_color:
		color.Blue:
			$Sprite2D.region_rect = Rect2(80.0,32.0,16,16)
		color.Yellow:
			$Sprite2D.region_rect = Rect2(128.0,32.0,16,16)
		_:
			$Sprite2D.region_rect = Rect2(80.0,32.0,16,16)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed
