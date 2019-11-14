extends Control

var is_muted: bool = false

func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_PAUSED, self, "_on_game_paused")


func _on_MenuButton_pressed():
	get_tree().paused = true
	
	self.visible = true


func _on_ResumeButton_pressed() -> void:
	self.visible = false
	
	get_tree().paused = false


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_SoundButton_pressed() -> void:
	ConfigurationProvider.toggle_sound_muted()
	
	var buttonText: String = 'Sound OFF'
	
	if ConfigurationProvider.configuration.sound_muted:
		buttonText = 'Sound ON'
	
	$VBoxContainer/SoundButton.text = buttonText
