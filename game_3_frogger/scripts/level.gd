extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lives_display_value_changed(value: int) -> void:
	if value <= 0:
		print("YOU LOSE")


func _on_home_frog_arrived() -> void:
	$HomeManager.incrementValue(1)


func _on_home_manager_value_changed(value: int) -> void:
	if value >= 5:
		print("YOU WIN")


func _on_player_player_died() -> void:
	$LivesDisplay.decrementValue(1)
