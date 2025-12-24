extends PanelContainer
@onready var final_score_label: Label = $MarginContainer2/VBoxContainer/FinalScoreLabel

func _on_restart_button_pressed() -> void:
	GameManager.restart_game()

func set_final_score(score:int) -> void:
	final_score_label.text = str("FINAL SCORE: ", score)


func _on_menu_pressed() -> void:
	GameManager.menu()
