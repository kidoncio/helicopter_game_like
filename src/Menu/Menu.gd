extends Control

signal menu_openned

func _ready():
	SignalProvider.connect(SignalProvider.GAME_PAUSED, self, "_on_game_paused")
	
	if GameProvider.high_scores:
		$VBoxContainer/HighScores.visible = true


func _on_PlayButton_pressed():
	if GameProvider.is_paused:
		self.visible = false
	else:
		get_tree().change_scene(GameProvider.MAIN_SCENE_PATH)


func _on_game_paused():
	self.visible = true
	$VBoxContainer/ButtonsContainer/ResumeContainer.visible = true


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_ResumeButton_pressed():
	emit_signal(SignalProvider.GAME_RESUMED)
	self.visible = false
