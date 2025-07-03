extends Node2D
@export var pipe: PackedScene
var minPipeDistance = 2.7
var MaxPipeDistance = 3.2
var nextPipe
var currentPipe
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
	
func _ready() -> void:
	spawn_new_pipe()

# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func spawn_new_pipe() -> void:
	var distance = randf_range(minPipeDistance, MaxPipeDistance)
	nextPipe = pipe.instantiate()
	
	nextPipe.distance = distance * 100
	
	add_child(nextPipe)
	
	if(currentPipe):
		nextPipe.position.x = currentPipe.position.x + 500
	else:
		nextPipe.position.x = position.x
	
	currentPipe = nextPipe
	timer.start()
	
	


func _on_timer_timeout() -> void:
	spawn_new_pipe()
	
