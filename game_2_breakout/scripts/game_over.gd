extends Control
var score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
#	Or go back to menu
