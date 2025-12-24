class_name HurtComponent
extends Area2D
signal hurt

func _on_area_entered(_area: Area2D) -> void:
	#var hit_component = area as HitComponent 
	hurt.emit()
	
	
	#area.get_parent().queue_free()
