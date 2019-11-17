extends RigidBody2D


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")
	set_process_input(true)
	
	pass


func _input(event) -> void:
	if event.is_action_pressed("touch") || event is InputEventScreenTouch:
		if !$ClickTimer.is_stopped():
			return
		
		touch_pressed()
		
		$ClickTimer.start()


func touch_pressed() -> void:
	if !$AnimatedSprite.is_playing():
		return
	
	apply_impulse(Vector2(0, 0), Vector2(0, -550))
	
	play_audio()


func _on_game_over() -> void:
	$AnimatedSprite.stop()
	
	apply_impulse(Vector2(0, 0), Vector2(-1000, 0))


func play_audio() -> void:
	if $AnimationPlayer.is_playing():
		return
	
	$AnimationPlayer.play("fly")