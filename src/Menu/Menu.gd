extends Control

func _ready():
	if GameProvider.high_scores:
		$VBoxContainer/HighScores.visible = true


func _on_PlayButton_pressed():
	get_tree().change_scene(GameProvider.MAIN_SCENE_PATH)


func _on_QuitButton_pressed():
	get_tree().quit()
