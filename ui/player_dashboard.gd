extends CanvasLayer

const GREENHOUSE = preload("res://flower_garden/flower_garden.tscn")
const STORE = preload("res://flower_store/store.tscn")

var is_dashboard_enabled: bool = false :set = set_is_dashboard_enabled

@onready var greenhouse_scene: Button = %GreenhouseSceneButton
@onready var store_scene: Button = %StoreSceneButton

func _ready() -> void:
	greenhouse_scene.pressed.connect(on_greenhouse_scene_button_pressed)
	store_scene.pressed.connect(on_store_scene_button_pressed)
	is_dashboard_enabled = false

func on_greenhouse_scene_button_pressed() -> void:
	get_tree().change_scene_to_packed(GREENHOUSE)
	is_dashboard_enabled = false

func on_store_scene_button_pressed() -> void:
	get_tree().change_scene_to_packed(STORE)
	is_dashboard_enabled = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_dashboard"):
		is_dashboard_enabled = not is_dashboard_enabled

func set_is_dashboard_enabled(new_value: bool) -> void:
	is_dashboard_enabled = new_value
	@warning_ignore("standalone_ternary")
	show() if is_dashboard_enabled else hide()
	
