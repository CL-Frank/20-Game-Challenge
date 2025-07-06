extends StaticBody2D
@onready var sprite: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sprite_size = sprite.texture.get_size()
	var wall_size = scale * sprite_size
	sprite.region_rect.size= wall_size
	sprite.scale /= scale
