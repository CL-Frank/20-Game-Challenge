extends Node2D
@export var vehicle : PackedScene
enum Direction { LEFT, RIGHT }
@export var direction: Direction = Direction.LEFT
@export var Sprite_Color: Racer.color

@onready var timer: Timer = $Timer
@export var delay: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = delay


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn():
	var new_vehicle:Vehicle = vehicle.instantiate()
	if new_vehicle is Racer:
		var new_racer:Racer = new_vehicle
		new_racer.Sprite_Color = Sprite_Color
		add_child(new_racer)
		new_racer.global_position = global_position
		new_racer.direction = Vector2.LEFT if direction == Direction.LEFT else Vector2.RIGHT
	else:
		add_child(new_vehicle)
		new_vehicle.global_position = global_position
		new_vehicle.direction = Vector2.LEFT if direction == Direction.LEFT else Vector2.RIGHT


#func _on_timer_timeout() -> void:
	#spawn()
