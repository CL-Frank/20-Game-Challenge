extends Node2D
@onready var score_label: Label = $UI/Score
@export var paddle: PackedScene
@onready var paddle_start_pos: Node2D = $PaddleStartPos
@onready var lives: Label = $UI/Lives
@onready var game_over: Control = $GameOver
@onready var start_hint: Label = $UI/StartHint
@onready var win: Label = $UI/Win
@onready var brick_spawner: Node2D = $BrickSpawner

var ball 
var score = 0
func _ready() -> void:
	var paddle = paddle.instantiate()
	paddle_start_pos.add_child(paddle)
	ball = get_tree().get_first_node_in_group("Ball")
	lives.text = "LIVES: " + str(ball.get_lives())
	ball.brick_destroyed.connect(_on_ball_brick_destroyed)

	
#func startGame() -> void:
	#print("Game Started")
	
func endGame() -> void:
#	Show game over screen
	game_over.show()
	$GameOver/FinalScoreLabel.text += str(score)
	
	print("Game OVER")


func _on_ball_life_lost() -> void:
	lives.text = "LIVES: " + str(ball.get_lives())


func _on_ball_brick_destroyed() -> void:
	score+=100
	score_label.text = "SCORE: " + str(score)


func _on_ball_dead() -> void:
	endGame();


func _on_ball_game_started() -> void:
	start_hint.hide()


func _on_brick_spawner_won() -> void:
	
	win.show()
	ball.queue_free()
	win.text += "\nFinal Score: " + str(score)


func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()
