extends Node2D

@export var rows := 3
@export var cols := 4
var brickSize
var brickCount

@export var brick: PackedScene
@export var margin = Vector2(8,8)
@export var spawnStart: Marker2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnBricks()
			
func _on_brick_destroyed():
	brickCount -= 1
	if brickCount ==0:
		print("All Bricks Destroyed")
		#Ball. Stop Ball

func spawnBricks():
	brickCount = rows * cols
	var test_brick = brick.instantiate()
	add_child(test_brick)
	await get_tree().process_frame  # Wait one frame for size to become valid
	var brick_size = test_brick.get_size()
	test_brick.queue_free()
	
	print("Brick size: ", brick_size)

	var row_width = brick_size.x * cols + margin.x * (cols -1)
	var spawn_origin_x = (-row_width + brick_size.x + margin.x) / 2
	var spawn_origin_y = spawnStart.position.y

	for i in range(rows):
		for j in range(cols):
			var new_brick = brick.instantiate() as Brick
			add_child(new_brick)
			var x = spawn_origin_x + j * (margin.x + brick_size.x)
			var y = spawn_origin_y + i * (margin.y + brick_size.y)
			new_brick.global_position = Vector2(x, y)
			
			if new_brick.has_signal("destroyed"):
				new_brick.destroyed.connect(_on_brick_destroyed)

	
