extends Node2D
@onready var top: Area2D = $Top
@onready var bottom: Area2D = $Bottom
@onready var goal: Area2D = $Goal


var gap = 500

var cleared = false

var heightVariation = 1.0
var minHeight = -200.0 * heightVariation
var maxHeight = 200.0 * heightVariation

func _ready() -> void:
	#Center Gap between the two pipes
	top.position.y = gap
	bottom.position.y = -gap
	
	#Ensure the goal covers the entire Center Gap
	#goal.scale.y += gap/60
	
	var height = randf_range(minHeight, maxHeight)
	position.y = height 

func _on_goal_body_entered(body: Node2D) -> void:
	$Timer.start()
	cleared = true
	body.score += 1

func _on_timer_timeout() -> void:
	queue_free()


func _on_top_body_entered(body: Node2D) -> void:
	body.endGame()
