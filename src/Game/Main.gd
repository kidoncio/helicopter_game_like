extends Node2D


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")
	SignalProvider.connect(SignalProvider.GAME_RESUMED, self, "_on_game_resumed")
	
	init_tutorial()


func _on_game_over() -> void:
	$Background.stop(false)
	
	$GameOverTimer.start()


func _on_game_resumed() -> void:
	$Background.play("Background")


func _on_GameOverTimer_timeout() -> void:
	PointProvider.points = 0
	
	get_tree().change_scene(GameProvider.MENU_SCENE_PATH)


func init_tutorial() -> void:
	if GameProvider.tutorial_is_showed:
		return
	
	$Background.stop(false)
	
	get_tree().paused = true
	
	$Tutorial/Control.visible = true