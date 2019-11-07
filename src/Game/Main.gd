extends Node2D


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")


func _on_game_over() -> void:
	$Background.stop(false)
	
	$GameOverTimer.start()


func _on_GameOverTimer_timeout() -> void:
	PointProvider.points = 0
	
	get_tree().change_scene(GameProvider.MENU_SCENE_PATH)