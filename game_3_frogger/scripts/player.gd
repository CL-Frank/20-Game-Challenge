extends Area2D

#64x64 tile size
var tile_size = 64
var inputs = {"right" : Vector2.RIGHT,
"left": Vector2.LEFT, "up": Vector2.UP, "down": Vector2.DOWN}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			
func move(dir):
	position += inputs[dir] * tile_size
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
