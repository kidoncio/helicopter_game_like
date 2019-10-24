extends Node2D


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")


func _on_game_over() -> void:
	$Background.stop(false)
