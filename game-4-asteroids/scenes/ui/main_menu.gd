extends Control

func _on_play_button_pressed():
	SceneManager.change_to_scene(SceneManager.Scene.GAME)

func _on_quit_button_pressed():
	get_tree().quit()
