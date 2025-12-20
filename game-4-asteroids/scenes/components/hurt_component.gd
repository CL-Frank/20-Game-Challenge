class_name HurtComponent
extends Area2D
signal hurt

func _on_area_entered(area: Area2D) -> void:
	#var hit_component = area as HitComponent 
	hurt.emit(area)
