extends Node2D


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")
	SignalProvider.connect(SignalProvider.GAME_RESUMED, self, "_on_game_resumed")


func _on_game_over() -> void:
	$Background.stop(false)
	
	$GameOverTimer.start()


func _on_GameOverTimer_timeout():
	get_tree().change_scene(GameProvider.MENU_SCENE_PATH)


func _on_game_resumed():
	get_tree().paused = false


func _on_MenuButton_pressed():
	emit_signal(SignalProvider.GAME_PAUSED)
	get_tree().paused = true
	GameProvider.is_paused = true
