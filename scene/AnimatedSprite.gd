extends AnimatedSprite



func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		play("run")
		flip_h = false
	elif motion.x < 0:
		play("run")
		flip_h = true
	else:
		play("idle")


func _on_KinematicBody2D_animate():
	pass # Replace with function body.
