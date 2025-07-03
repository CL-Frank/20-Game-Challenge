extends Node2D
@export var pipe: PackedScene
var minPipeDistance = 2.8
var MaxPipeDistance = 3.2
var nextPipe
var currentPipe

var distanceVariation = 1.0
var heightVariation = 1.0

var waitTime = 1.0

@onready var timer: Timer = $TimeBetweenPipes
# Called when the node enters the scene tree for the first time.
	
func start() -> void:
	spawn_new_pipe()
	spawn_new_pipe()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(currentPipe && currentPipe.cleared):
		spawn_new_pipe()
		currentPipe = nextPipe
		
func spawn_new_pipe() -> void:
	#Randomize the center gap of each pipe instance
	var gap = randf_range(minPipeDistance, MaxPipeDistance * heightVariation)
	nextPipe = pipe.instantiate()
	nextPipe.gap = gap * 100
	add_child(nextPipe)
	#Distance each pipe pair instance by 500px
	if(currentPipe):
		nextPipe.position.x = float(currentPipe.position.x) + (500 * distanceVariation)
	else:
		nextPipe.position.x = position.x
	currentPipe = nextPipe
	
			 
