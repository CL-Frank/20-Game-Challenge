extends Node
class_name  AutoMover2D

@export var speed: Vector2
@export var target:Node2D

signal moved(movement_amount:Vector2)

func _process(delta: float) -> void:
	var moved_amount = speed * delta
	target.position += moved_amount
	moved.emit(moved_amount)
