extends Position2D

onready var pipe = preload("res://src/Pipe/Pipe.tscn")


func _ready() -> void:
	SignalProvider.connect(SignalProvider.GAME_OVER, self, "_on_game_over")
	randomize()

func _on_Timer_timeout() -> void:
	var new_pipe = pipe.instance()
	
	var pipe_y = rand_range(-550.0, 550.0)
	
	new_pipe.position = self.position + Vector2(0, pipe_y)
	
	get_owner().add_child(new_pipe)


func _on_game_over():
	$Timer.autostart = false
	$Timer.stop()
