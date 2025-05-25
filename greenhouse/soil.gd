class_name SoilLayer extends TileMapLayer

const NO_TILE = -1

var seed_placement_map: Dictionary[Vector2i, Flower] = {}

var sunflower_scene := preload("res://flowers/sunflower.tscn")

func _ready() -> void:
	if get_tree().current_scene == get_parent():
		var camera = Camera2D.new()
		add_child(camera)
		camera.zoom *= 2
		
func _unhandled_input(event: InputEvent) -> void:
	var input_tile_location = local_to_map(get_global_mouse_position())
	var has_a_tile_at_location := get_cell_source_id(input_tile_location) != NO_TILE
	
	var is_seed_placed_in_soil = seed_placement_map.has(input_tile_location)
	if is_seed_placed_in_soil:
		return
	
	if event.is_action_pressed("plant") and has_a_tile_at_location: # plant seed
		var sunflower_instance: Flower = sunflower_scene.instantiate()
		add_child(sunflower_instance) # scene
		sunflower_instance.top_level = true
		sunflower_instance.plant_flower(map_to_local(input_tile_location))
		seed_placement_map[input_tile_location] = sunflower_instance # map
