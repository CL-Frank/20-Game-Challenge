extends Node

enum Scene { MAIN_MENU, GAME, GAME_OVER }

func change_to_scene(scene: Scene):
	match scene:
		Scene.MAIN_MENU:
			get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
		Scene.GAME:
			get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")
		Scene.GAME_OVER:
			get_tree().change_scene_to_file("res://scenes/ui/game_over_screen.tscn")

func restart_game():
	change_to_scene(Scene.GAME)

func go_to_menu():
	change_to_scene(Scene.MAIN_MENU)
