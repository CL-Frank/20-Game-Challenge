extends Node2D

var game_timer = 20
var max_game_timer = 0
var timer_expired = false
var score = 0
var furthest_y = 0
var game_over = false
@onready var timer_bar: TextureProgressBar = $TextureProgressBar
@onready var score_label: Label = $Control/ScoreLabel

func _ready() -> void:
	max_game_timer = game_timer
	timer_bar.max_value = max_game_timer
	furthest_y = $player.position.y
	update_score_display()
	
func _process(delta: float) -> void:
	if game_over or not $player.can_move:
		return
		
	game_timer -= delta
	timer_bar.value = game_timer
	
	# Check for new forward progress (10 points)
	if $player and $player.position.y < furthest_y:
		score += 10
		update_score_display()
		furthest_y = $player.position.y
	
	if game_timer <= 0 and not timer_expired:
		timer_expired = true
		$player.died()
	
	
	

func _on_lives_display_value_changed(value: int) -> void:
	if value < 0:
		game_over = true
		Engine.time_scale = 0
		$GameOverScreen.Display("You Lose!",score)
		$player.queue_free()
		$Sounds/BackgroundMusic.stop()
		$Sounds/LoseSound.play()
	else:
		$player.respawn()


func _on_home_frog_arrived() -> void:
	# 50 points for reaching home + time bonus
	score += 50 + int(game_timer * 10)
	update_score_display()
	
	$Homes/HomeManager.incrementValue(1)
	$Sounds/ArriveHomeSound.play()
	game_timer = max_game_timer
	timer_expired = false
	timer_bar.value = game_timer
	$player.respawn()
	furthest_y = $player.position.y


func _on_home_manager_value_changed(value: int) -> void:
	if value >= 5:
		# 1000 point bonus for completing level
		score += 1000
		update_score_display()
		game_over = true
		$GameOverScreen.Display("You Win!",score)
		$BackgroundMusic.stop()
		$Sounds/WinSound.play()
		$player.queue_free()


func _on_player_player_died() -> void:
	$LivesDisplay.decrementValue(1)
	game_timer = max_game_timer
	timer_expired = false
	furthest_y = $player.position.y


func _on_play_area_area_exited(_area: Area2D) -> void:
	$player.died()

func update_score_display():
	score_label.text = "Score: " + str(score)
