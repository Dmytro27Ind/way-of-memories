extends Node2D

var is_lamp_swich_on = false

signal checkpoint_pos

func _on_Area2D_body_entered(body):
	if is_lamp_swich_on == false:
		is_lamp_swich_on = true
		emit_signal("checkpoint_pos", body.position)
