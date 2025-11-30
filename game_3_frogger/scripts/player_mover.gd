extends Node2D

var player:Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_detector_area_entered(area: Area2D) -> void:
	player = area
	if player != null:
		print("player found")


func _on_player_detector_area_exited(area: Area2D) -> void:
	player = null

func move_player(movement_amount: Vector2):
	if player != null:
		player.position += movement_amount
		
func clearCollisionShapes():
	for child in $PlayerDetector.get_children():
		child.queue_free()
		
func addCollisionShape(shape: CollisionShape2D):
	$PlayerDetector.add_child(shape)
