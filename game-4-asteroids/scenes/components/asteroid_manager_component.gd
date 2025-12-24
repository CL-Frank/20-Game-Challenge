class_name AsteroidManagerComponent
extends Node

var asteroid_scene = preload("res://scenes/asteroids/asteroid.tscn")
var asteroid_explod_particles = preload("res://scenes/asteroids/asteroid_explode_particles.tscn")
var asteroid_explode_sfx = preload("res://scenes/audio/sfx/asteroid_explode_sfx.tscn")

var asteroids : Node2D

func _ready() -> void:
	asteroids = get_tree().current_scene.get_node("Asteroids")
	for asteroid:Asteroid in asteroids.get_children():
		asteroid.exploded.connect(on_asteroid_exploded)
		
func connectAsteroids() -> void:
	for asteroid:Asteroid in asteroids.get_children():
		asteroid.exploded.connect(on_asteroid_exploded)
		
func on_asteroid_exploded(pos, size) -> void:
	await get_tree().process_frame
	var asteroid_explod_particles_instance = asteroid_explod_particles.instantiate()
	var asteroid_explode_sfx_instance = asteroid_explode_sfx.instantiate()
	
	
	
	asteroids.add_child(asteroid_explod_particles_instance)
	asteroid_explod_particles_instance.global_position = pos
	
	match size:
		Asteroid.AsteroidSize.LARGE:
			
			GameManager._increment_score(20)
		Asteroid.AsteroidSize.MEDIUM:
			
			GameManager._increment_score(50)
		Asteroid.AsteroidSize.SMALL:
			GameManager._increment_score(100)
	spawnAsteroid(pos,size)
	asteroids.add_child(asteroid_explode_sfx_instance)

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
