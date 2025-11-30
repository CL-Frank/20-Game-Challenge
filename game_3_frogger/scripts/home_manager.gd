extends Node

var current_value = 0

signal value_changed(value:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func incrementValue(value):
	current_value += value
	value_changed.emit(current_value)

func decrementValue(value):
	current_value -= value
	value_changed.emit(current_value)
