extends Node2D

@export var debug: bool
@export var player: Player
@export var asteroids: Node2D

@export var AsteroidManager: AsteroidManagerComponent

var asteroid_scene = preload("res://scenes/asteroids/asteroid.tscn")

var can_spawn
#The minimum distance an asteroid can spawn close to the player, checked individually on each axis
var offset: float = 200.0

var current_wave: int = 0
var max_spawns: int = 4

var closest:float = 1000

func _ready() -> void:
	for asteroid in asteroids.get_children():
		asteroid.queue_free()
	nextWave()
	
func _process(_delta: float) -> void:
	if debug:
		if Input.is_action_just_pressed("debug_new_wave"):
			debug_next_wave()
	if asteroids.get_children().size() == 0:
		nextWave()

func nextWave() -> void:
	spawnWave()
	current_wave += 1
	if max_spawns < 12:
		max_spawns += 1 

func spawnWave() -> void:
	for rock in range(max_spawns):
		var asteroid_instance = asteroid_scene.instantiate() as Asteroid
		asteroid_instance.global_position = getRandomSpawnPos()
		asteroids.add_child(asteroid_instance)
	if debug:
		print("Closest Spawn: ", closest)
		closest = 1000
	AsteroidManager.connectAsteroids()
		
func debug_next_wave() -> void:
	for asteroid in asteroids.get_children():
		asteroid.queue_free()
	nextWave()

func getRandomSpawnPos() -> Vector2:
	var screen_size = get_viewport_rect().size
	
	var rndX
	var rndY 
	var spawn_attempt: Vector2
	var distance
	can_spawn = false
	while !can_spawn:
		var spawnEdge = randi_range(0,3)
	#	Top Edge
		if spawnEdge == 0:
			rndX = randf_range(0, screen_size.x)
			rndY = -offset
			distance = absf(rndX - player.position.x)
	#	Right Edge
		elif spawnEdge == 1:
			rndX = screen_size.x + offset
			rndY = randf_range(0, screen_size.y)
			distance = absf(rndY - player.position.y)
	#	Bottom Edge
		elif spawnEdge == 2:
			rndX = randf_range(0, screen_size.x)
			rndY = screen_size.y + offset
			distance = abs(rndX - player.position.x)
	#	Left Edge
		elif spawnEdge == 3:
			rndX = -offset
			rndY = randf_range(0, screen_size.y)
			distance = absf(rndY - player.position.y)
		
		if distance > offset:
			if distance < closest:
				closest = distance
			can_spawn = true
		
		spawn_attempt = Vector2(rndX, rndY)
		#var distance: float = spawn_attempt.distance_to(player.position)
		#if distance > offset * 5:
			#if distance < closest:
				#closest = distance
			#can_spawn = true
			
	
	return spawn_attempt
