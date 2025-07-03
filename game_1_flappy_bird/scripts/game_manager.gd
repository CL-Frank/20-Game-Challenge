extends Node2D
@export var difficulty = 0.0
@export_range(1,5) var pipeDistanceVariation: float
@export_range(1,5) var pipeHeightVariation : float
@onready var score_label: Label = $Control/Score
@onready var bird: CharacterBody2D = $bird
@onready var fps_label: Label = $Control/FPS
@onready var game_time: Timer = $GameTime

@onready var controls: Label = $Control/Controls

var SPEED = 250
var score = 0
var fps = 0.0

@export var pipe_spawner: Node2D


func _ready() -> void:
	pipe_spawner.distanceVariation = pipeDistanceVariation
	pipe_spawner.heightVariation = pipeHeightVariation

	
func _process(delta: float) -> void:
	if bird.start:
		pipe_spawner.position.x -= SPEED * delta
		score_label.text = "SCORE\n" + str(bird.score)
		fps_label.text = str(Engine.get_frames_per_second())
		controls.hide()
	#difficulty += 0.01 * delta
	


func _on_game_time_timeout() -> void:
	SPEED += 5
