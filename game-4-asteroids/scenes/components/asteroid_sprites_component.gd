class_name AsteroidSpritesComponent
extends Node

@export var asteroid: Asteroid
@export var screen_offset: ScreenOffsetComponent
@export var object_float: ObjectFloatComponent


@export var sprite_2d: Sprite2D
@export var hit_component_collision_shape: CollisionShape2D
@export var hurt_component_collision_shape: CollisionShape2D


@export var large_sprites: Array[Texture2D]
@export var medium_sprites: Array[Texture2D]
@export var small_sprites: Array[Texture2D]



func _ready() -> void:
	call_deferred("init_asteroid")
	

func init_asteroid() -> void:
	
	if sprite_2d != null:
		match asteroid.size:
			asteroid.AsteroidSize.LARGE:
				var index = randi_range(0, large_sprites.size() - 1)
				sprite_2d.texture = large_sprites[index]
				hit_component_collision_shape.shape = preload("res://resources/large_asteroid_collision_size.tres")
				hurt_component_collision_shape.shape = preload("res://resources/large_asteroid_collision_size.tres")
				object_float.speed = randf_range(50,100)
			asteroid.AsteroidSize.MEDIUM:
				var index = randi_range(0, medium_sprites.size() - 1)
				sprite_2d.texture = medium_sprites[index]
				hit_component_collision_shape.shape = preload("res://resources/medium_asteroid_collision_size.tres")
				hurt_component_collision_shape.shape = preload("res://resources/medium_asteroid_collision_size.tres")
				object_float.speed = randf_range(100,150)
			asteroid.AsteroidSize.SMALL:
				var index = randi_range(0, small_sprites.size() - 1)
				sprite_2d.texture = small_sprites[index]
				hit_component_collision_shape.shape = preload("res://resources/small_asteroid_collision_size.tres")
				hurt_component_collision_shape.shape = preload("res://resources/small_asteroid_collision_size.tres")
				object_float.speed = randf_range(100,200)
			
		screen_offset.offset = hurt_component_collision_shape.shape.radius
			
