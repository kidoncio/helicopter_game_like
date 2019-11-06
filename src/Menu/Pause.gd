extends Control


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_PAUSED, self, "_on_game_paused")


func _on_game_paused() -> void:
	