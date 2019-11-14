extends Control


func _input(event) -> void:
	if GameProvider.tutorial_is_showed:
		return
	
	if event.is_action_pressed("touch") || event is InputEventScreenTouch:
		SignalProvider.emit_signal(SignalProvider.GAME_RESUMED)
		
		get_tree().paused = false
		
		self.visible = false
		
		GameProvider.tutorial_is_showed = true