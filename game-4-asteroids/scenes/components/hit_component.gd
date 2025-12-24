class_name HitComponent
extends Area2D

signal hit
func _on_area_entered(_area: Area2D) -> void:
	#if area.is_in_group("asteroid"):
	hit.emit()
	get_parent().queue_free()
