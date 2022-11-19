extends Node2D


signal heart_collect


func _on_Area2D_body_entered(body):
	emit_signal("heart_collect")
	$AnimationPlayer.play("vanish")

func vanish():
	queue_free()
	
