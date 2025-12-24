class_name ScoreCounter
extends Control
@onready var score_label: Label = $PanelContainer/MarginContainer/ScoreLabel

func _ready() -> void:
	GameManager.score_changed.connect(on_score_changed)
	GameManager.player_lost.connect(on_player_lost)
	
func on_score_changed(score: int) -> void:
	score_label.text = str("SCORE: " ,score)

func on_player_lost() -> void:
	score_label.hide()
