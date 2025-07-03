extends Control

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_manager.tscn")
