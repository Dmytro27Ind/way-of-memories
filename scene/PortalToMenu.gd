extends Node2D


var rotationSpeed = -0.01

func _physics_process(delta):
	$AnimatedSprite.rotate(rotationSpeed)
	$Area2D/CollisionShape2D.rotate(rotationSpeed)


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://scene/menu.tscn")
