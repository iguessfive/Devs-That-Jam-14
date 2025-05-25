class_name Character extends CharacterBody2D

var target_position: Vector2: set = set_target_position
var is_ready_to_leave_store: bool = false

@warning_ignore("unused_private_class_variable")
var _entry_position := global_position # store AI customer entry_point

@onready var _animated_sprite: AnimatedSprite2D = %AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if target_position == null:
		return
	
	var direction = global_position.direction_to(target_position)
	position += direction * 25.0 * delta

func set_target_position(new_position) -> void:
	target_position = new_position
	play_walk_animation()

func play_walk_animation(for_direction: Vector2 = target_position) -> void:
	match for_direction.sign():
		Vector2.LEFT, (Vector2.UP + Vector2.LEFT), (Vector2.DOWN + Vector2.LEFT):
			_animated_sprite.play("move_left")
		Vector2.UP:
			_animated_sprite.play("move_up")
		Vector2.RIGHT, (Vector2.UP + Vector2.RIGHT), (Vector2.DOWN + Vector2.RIGHT):
			_animated_sprite.play("move_right")
		Vector2.DOWN:
			_animated_sprite.play("move_down")
		_:
			push_error("character animation did not play")
	
	
	
	
