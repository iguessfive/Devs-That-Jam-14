extends Node2D

@onready var _soil: SoilLayer = %Soil

func _unhandled_input(event: InputEvent) -> void:
	var input_tile_location = _soil.local_to_map(get_global_mouse_position())
	var is_seed_placed_at_tile = _soil.seed_placement_map.has(input_tile_location)
	
	if is_seed_placed_at_tile:
		var can_flower_be_harvested = 	_soil.seed_placement_map[input_tile_location].is_flower_ready
		if not can_flower_be_harvested:
			return
		if event.is_action("harvest"):
			_soil.seed_placement_map[input_tile_location].harvest_flower()
			_soil.seed_placement_map.erase(input_tile_location)
		 	
			#TBD increase flower count for current flower
