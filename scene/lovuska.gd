extends KinematicBody2D


var rotationSpeed = -0.01

signal trap

func _physics_process(delta):
	$Sprite39.rotate(rotationSpeed)
	$Sprite39/Area2D/CollisionPolygon2D.rotate(rotationSpeed)


func _on_Area2D_body_entered(body):
	if body.name == "player":
		emit_signal("trap")
