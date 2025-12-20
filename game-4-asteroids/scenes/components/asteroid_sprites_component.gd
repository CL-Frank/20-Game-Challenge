class_name AsteroidSpritesComponent
extends Node
@export var sprite_2d: Sprite2D

@export var sprites: Array[Texture2D]

func _ready() -> void:
	call_deferred("set_random_texture")

func set_random_texture() -> void:
	var index = randi_range(0, sprites.size() - 1)
	if sprite_2d != null:
		sprite_2d.texture = sprites[index]
