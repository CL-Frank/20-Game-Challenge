extends Node

signal score_changed
signal lives_changed
signal player_lost

var game_over_screen_scene = preload("res://scenes/ui/game_over_screen.tscn")

var lives: int = 3
var score: int = 0

func _ready() -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	var player = get_player()
	if player != null:
		player.respawn_player()
	score_changed.emit(score)
	lives_changed.emit(lives)

func get_player() -> Player:
	var player = get_tree().current_scene.get_node("Player")
	if player != null:
		return player
	return null

func _increment_score(value:int) -> void:
	score += value
	score_changed.emit(score)

func decrement_life() -> void:
	lives -= 1
	lives_changed.emit(lives)
	if lives <= 0:
		player_lost.emit()
		print("GAME OVER")
		var game_over_screen_instance = game_over_screen_scene.instantiate()
		var game_screen = get_tree().current_scene.get_node("GameScreen")
		if game_screen != null:
			game_screen.add_child(game_over_screen_instance)
			game_over_screen_instance.set_final_score(score)
		return
	var player = get_player()
	if player != null:
		player.respawn_player()

	
func restart_game() -> void:
	score = 0
	lives = 3
	SceneManager.restart_game()
	
func menu() -> void:
	score = 0
	lives = 3
	SceneManager.go_to_menu()
