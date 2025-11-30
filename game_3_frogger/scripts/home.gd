extends Node2D

signal frog_arrived
@export var texture:Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	$Frog_Home.visible = true
	$Area2D.collision_layer = 2
	frog_arrived.emit()
