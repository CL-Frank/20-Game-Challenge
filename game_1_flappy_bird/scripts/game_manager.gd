extends Node2D
@export var difficulty = 0.0
@export_range(1,5) var pipeDistanceVariation: float
@export_range(1,5) var pipeHeightVariation : float
@onready var score_label: Label = $Control/Score
@onready var bird: CharacterBody2D = $bird
@onready var fps_label: Label = $Control/FPS

var SPEED = 250
var score = 0
var fps = 0.0

@export var pipe_spawner: Node2D


func _ready() -> void:
	pipe_spawner.distanceVariation = pipeDistanceVariation
	pipe_spawner.heightVariation = pipeHeightVariation
	pipe_spawner.is_ready = true
	
	pipe_spawner.start()
	
	print(pipe_spawner.distanceVariation)
	
func _process(delta: float) -> void:
	pipe_spawner.position.x -= SPEED * delta
	score_label.text = "SCORE\n" + str(bird.score)
	fps_label.text = str(Engine.get_frames_per_second())
	#difficulty += 0.01 * delta
	


func _on_game_time_timeout() -> void:
	SPEED += 5
