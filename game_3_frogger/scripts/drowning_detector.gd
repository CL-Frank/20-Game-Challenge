extends Node2D

signal drowned

var water_collisions:int = 0
var was_drowning_last_frame = false

var platform_collisions:int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var is_drowning = water_collisions > 0 && platform_collisions <= 0
	if is_drowning && !was_drowning_last_frame:
		drowned.emit()
	was_drowning_last_frame = is_drowning

func _on_water_detector_body_entered(body: Node2D) -> void:
	water_collisions += 1


func _on_water_detector_body_exited(body: Node2D) -> void:
	water_collisions -= 1


func _on_platform_detector_area_entered(area: Area2D) -> void:
	platform_collisions += 1


func _on_platform_detector_area_exited(area: Area2D) -> void:
	platform_collisions -= 1
