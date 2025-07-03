extends Node2D
@onready var top: Area2D = $Top
@onready var bottom: Area2D = $Bottom
@onready var goal: Area2D = $Goal

var distance = 500
var minHeight = -200
var maxHeight = 200

func _ready() -> void:
	var height = randf_range(minHeight, maxHeight)
	top.position.y = distance
	bottom.position.y = -distance
	
	goal.scale.y = distance/30
	
	position.y = height
	print(height)


func _on_goal_body_entered(body: Node2D) -> void:
	$Timer.start()


func _on_timer_timeout() -> void:
	queue_free()
