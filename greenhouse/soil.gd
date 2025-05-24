extends TileMapLayer

var seed_placement_map: Dictionary[Vector2i, Flower] = {}

var amount_of_sunflowers := 5
var sunflower_scene := preload("res://flowers/sunflower.tscn")

func _ready() -> void:
	if get_tree().current_scene == get_parent():
		var camera = Camera2D.new()
		add_child(camera)
		camera.zoom *= 2
	
	var sunflower_instance: Flower = sunflower_scene.instantiate()
	add_child(sunflower_instance)
	sunflower_instance.top_level = true
	var target_position = Vector2i(-6,-3)
	
	if not seed_placement_map.has(target_position):
		sunflower_instance.plant_flower(map_to_local(target_position))
		seed_placement_map[target_position] = sunflower_instance
		print(seed_placement_map)
	
	
