extends Area2D

func _ready() -> void:
	body_entered.connect(func(body: Node2D): 
		if body is Character:
			body.set_physics_process(false)
			body._animated_sprite.stop() #WARNING temp code to stop animation when overlap
	)
