extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_texture_button_pressed() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	
func Display(message:String, score:int):
	$NinePatchRect/VBoxContainer/Label.text = message
	$NinePatchRect/VBoxContainer/Label2.text = "Final Score: " + str(score)
	self.visible = true
