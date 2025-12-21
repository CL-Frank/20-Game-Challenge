extends Node

signal score_changed
signal lives_changed

var lives: int = 3
var score: int = 0

func _increment_score(i:int) -> void:
	score += i
	score_changed.emit(score)

func decrement_life() -> void:
	lives -= 1
	lives_changed.emit(lives)
	if lives <= 0:
		print("GAME OVER")
