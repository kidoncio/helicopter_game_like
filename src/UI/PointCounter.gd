extends CanvasLayer


func _ready():
	SignalProvider.connect(SignalProvider.EARNED_POINT, self, "_on_point_earned")


func _on_point_earned() -> void:
	PointProvider.points += 1
	
	$Label.text = String(PointProvider.points)
	$AnimationPlayer.play("score")