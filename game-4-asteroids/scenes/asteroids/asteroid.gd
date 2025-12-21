class_name Asteroid
extends Node2D

signal exploded
enum AsteroidSize{LARGE,MEDIUM,SMALL}
@onready var hurt_component: HurtComponent = $HurtComponent

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var size :AsteroidSize = AsteroidSize.LARGE

func _ready() -> void:
	hurt_component.hurt.connect(explode)
	
func explode() -> void:
	exploded.emit(global_position, size)
	queue_free()
