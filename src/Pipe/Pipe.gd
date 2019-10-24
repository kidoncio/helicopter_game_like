extends Node2D

export var velocity: int = -400


func _physics_process(delta) -> void:
	self.position = self.position + Vector2(velocity * delta, 0)
	
	if position.x < -100:
		queue_free()


func _on_Area2D_body_entered(body) -> void:
	if not body.is_in_group("Player"):
		pass
	
	velocity = 0
	
	SignalProvider.emit_signal(SignalProvider.GAME_OVER)
	$AnimationPlayer.play("hit_animation")

func _on_PointCounter_body_entered(body):
	SignalProvider.emit_signal(SignalProvider.EARNED_POINT)
