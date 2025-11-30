extends Node2D
@export var log:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn():
	var new_log:Log = log.instantiate()
	new_log.log_length = randi_range(3,5)
	add_child(new_log)
	new_log.global_position = global_position


func _on_timer_timeout() -> void:
	spawn()
