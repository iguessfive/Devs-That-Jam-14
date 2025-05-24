class_name Flower extends Area2D

var is_flower_ready := false

func can_flower_be_harvested() -> bool:
	return is_flower_ready

@warning_ignore("unused_parameter")
func plant_flower(at_location: Vector2) -> void:
	return
