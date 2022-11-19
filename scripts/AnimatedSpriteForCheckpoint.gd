extends AnimatedSprite

var is_lamp_swich_on = false

func _ready():
	play("off")

func _on_checkP_animate():
	if is_lamp_swich_on == false:
		play("off")
	else:
		play("on")



func _on_Area2D_body_entered(body):
	is_lamp_swich_on = true
	_on_checkP_animate()
