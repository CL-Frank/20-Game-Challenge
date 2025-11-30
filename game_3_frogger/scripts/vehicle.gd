extends Node2D
class_name Vehicle
@export var texture:Texture2D
@export var speed:Vector2
@export var rotation_offset: Vector2
@export var flip_h:bool

func _ready() -> void:
	$Sprite2D.texture = texture
	$Sprite2D.flip_h = flip_h
	$AutoMover2D.speed = speed
	$VisibilityOffset2D.offset_amount = rotation_offset
