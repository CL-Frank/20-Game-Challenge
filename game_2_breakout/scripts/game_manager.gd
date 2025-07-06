extends Node2D
@onready var score_label: Label = $UI/Score
@export var paddle: PackedScene
@onready var paddle_start_pos: Node2D = $PaddleStartPos
@onready var lives: Label = $UI/Lives
@onready var game_over: Control = $GameOver

var ball 
var score = 0
func _ready() -> void:
	var paddle = paddle.instantiate()
	paddle_start_pos.add_child(paddle)
	ball = get_tree().get_first_node_in_group("Ball")
	lives.text = "LIVES: " + str(ball.get_lives())
func startGame() -> void:
	print("Game Started")
func endGame() -> void:
#	Show game over screen
	game_over.show()
	print("Game OVER")


func _on_ball_life_lost() -> void:
	lives.text = "LIVES: " + str(ball.get_lives())


func _on_ball_brick_destroyed() -> void:
	score += 100
	score_label.text = "SCORE: " + str(score)


func _on_ball_dead() -> void:
	endGame();


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
