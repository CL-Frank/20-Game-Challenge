extends Vehicle


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.region_enabled = true
	$Sprite2D.region_rect = Rect2(96.0,32.0,32.0,16)
