extends CanvasLayer

const GREENHOUSE = preload("res://greenhouse/greenhouse.tscn")
const STORE = preload("res://flower_shop/store.tscn")

@onready var greenhouse_scene: Button = %GreenhouseSceneButton
@onready var store_scene: Button = %StoreSceneButton

func _ready() -> void:
	greenhouse_scene.pressed.connect(on_greenhouse_scene_button_pressed)
	store_scene.pressed.connect(on_store_scene_button_pressed)

func on_greenhouse_scene_button_pressed() -> void:
	get_tree().change_scene_to_packed(GREENHOUSE)

func on_store_scene_button_pressed() -> void:
	get_tree().change_scene_to_packed(STORE)
