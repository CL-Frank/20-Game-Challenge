extends Node2D
@export var difficulty = 0.0
@export_range(1,5) var pipeDistanceVariation: float
@export_range(1,5) var pipeHeightVariation : float
@onready var score_label: Label = $Control/Score
@onready var bird: CharacterBody2D = $bird
@onready var fps_label: Label = $Control/FPS
@onready var game_time: Timer = $GameTime

@onready var controls: Label = $Control/Controls
@onready var final_score_label: Label = $"./GameOver/FinalScoreLabel"


var SPEED = 250
var score = 0
var fps = 0.0
var playing = false
var alive = true

@export var pipe_spawner: Node2D


func _ready() -> void:
	pipe_spawner.distanceVariation = pipeDistanceVariation
	pipe_spawner.heightVariation = pipeHeightVariation
	#score_label.hide()


func startGame() -> void:
	Engine.time_scale = 1
	game_time.start()
	controls.hide()
	pipe_spawner.start()
	playing = true
	
func endGame() -> void:
	$GameOver.show()
	final_score_label.text = "FINAL SCORE: "+ str(score)
	score_label.hide()
	game_time.stop()
	playing = false
	alive = false
	Engine.time_scale = 0
	
func increaseScore() -> void:
	score+=1
	#score_label.show()
	score_label.text = "SCORE\n" + str(score)
	
func _process(delta: float) -> void:
	if playing:
		pipe_spawner.position.x -= SPEED * delta
		
		fps_label.text = str(Engine.get_frames_per_second())
	
func _on_game_time_timeout() -> void:
	SPEED += 10
