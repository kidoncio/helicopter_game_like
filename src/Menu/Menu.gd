extends Control

func _ready():
	if GameProvider.high_scores:
		$VBoxContainer/HighScores.visible = true


func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/Game/Main.tscn")
