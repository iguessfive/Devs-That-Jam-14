class_name SunFlower extends Flower

var growth_stage :int = 0 :set = set_growth_stage

@onready var _animated_sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var _timer: Timer = $Timer

@onready var _planting: AudioStreamPlayer = %Planting
@onready var _harvesting: AudioStreamPlayer = %Harvesting

func _ready() -> void:
	_timer.wait_time = 1.0 #NOTE adjust the growth time for each stage?
	
	_timer.timeout.connect(func(): 
		growth_stage += 1
	)

func plant_flower(at_location: Vector2) -> void:
	global_position = at_location
	_planting.play()
	_timer.start()
	return
	
func set_growth_stage(to_next_stage: int) -> void:
	var max_growth_stage = _animated_sprite.sprite_frames.get_frame_count("growing_stages") - 1
	growth_stage = min(to_next_stage, max_growth_stage)
	_animated_sprite.frame = growth_stage
	
	if growth_stage == max_growth_stage:
		is_flower_ready = true
		_timer.stop()

func harvest_flower() -> void:
	if not is_flower_ready:
		return
	_harvesting.play()
	_harvesting.finished.connect(queue_free)
	
	
	
	
