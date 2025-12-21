class_name AsteroidManagerComponent
extends Node

var asteroid_scene = preload("res://scenes/asteroids/asteroid.tscn")

@export var asteroids : Node2D

func _ready() -> void:
	for asteroid:Asteroid in asteroids.get_children():
		asteroid.exploded.connect(on_asteroid_exploded)
		
func on_asteroid_exploded(pos, size) -> void:
	await get_tree().process_frame
	match size:
		Asteroid.AsteroidSize.LARGE:
			GameManager._increment_score(20)
		Asteroid.AsteroidSize.MEDIUM:
			GameManager._increment_score(50)
		Asteroid.AsteroidSize.SMALL:
			GameManager._increment_score(100)
	spawnAsteroid(pos,size)

func spawnAsteroid(pos,size)-> void:
	for i in range(2):
		var asteroid_instance = asteroid_scene.instantiate() as Asteroid
		match size:
			Asteroid.AsteroidSize.LARGE:
				asteroid_instance.size = Asteroid.AsteroidSize.MEDIUM
			Asteroid.AsteroidSize.MEDIUM:
				asteroid_instance.size = Asteroid.AsteroidSize.SMALL
			Asteroid.AsteroidSize.SMALL:
				return
		asteroid_instance.global_position = pos
		asteroid_instance.exploded.connect(on_asteroid_exploded)
		
		asteroids.add_child(asteroid_instance)
