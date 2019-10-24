extends RigidBody2D


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")
	set_process_input(true)
	
	pass


func _input(event) -> void:
	if event.is_action_pressed("touch"):
		touch_pressed()


func touch_pressed() -> void:
	apply_impulse(Vector2(0, 0), Vector2(0, -1000))


func _on_game_over() -> void:
	$AnimatedSprite.stop()
	apply_impulse(Vector2(0, 0), Vector2(-1000, 0))