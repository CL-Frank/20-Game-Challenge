extends Node2D
class_name Platform

@export var flip_h:bool
@export var speed:Vector2
@export var rotation_offset:Vector2

@export var tile_offset:Vector2 = Vector2(16,0)
@export_range(1,5) var length:int :
	set(value):
		il = value
	get():
		return il
var il = 1	

func _ready():
	if $AutoMover2D:
		$AutoMover2D.speed = speed
	if $VisibilityOffset2D:
		$VisibilityOffset2D.offset_amount = rotation_offset
	if $Area2D and $PlayerMover:
		$Area2D.area_entered.connect($PlayerMover._on_player_detector_area_entered)
		$Area2D.area_exited.connect($PlayerMover._on_player_detector_area_exited)
	
		
	setupLength()
	
func setupLength():
	if $Area2D:
		for child in $Area2D.get_children():
			child.queue_free()
	
	if $PlayerMover:
		$PlayerMover.clearCollisionShapes()
	
	for item in range(1,length + 1):
		var shape = $Templates/CollisionShape2D.duplicate() as CollisionShape2D
		var sprite = $Templates/Sprite2D.duplicate() as Sprite2D
			
		sprite.position = (item - 1) * tile_offset
		shape.position += (item - 1) * tile_offset 
		
		sprite.flip_h = flip_h
			
		$Area2D.add_child(sprite)
		$Area2D.add_child(shape)
		$PlayerMover.addCollisionShape(shape.duplicate())
		
