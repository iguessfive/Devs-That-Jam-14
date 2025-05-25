extends Node2D

@onready var _service_area: Area2D = %ServiceArea
@onready var _entry_point: Marker2D = %EntryPoint

func _ready() -> void:
	if get_tree().current_scene == self:
		var camera = Camera2D.new()
		add_child(camera)
		camera.zoom *= 3
		
	$Character.target_position = _service_area.global_position
