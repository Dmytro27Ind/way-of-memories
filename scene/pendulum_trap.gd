extends KinematicBody2D

onready var timer =get_node("Timer")

var rotationSpeed = 0.03


func _ready():
	timer.set_wait_time(3)
	timer.start()

func _physics_process(delta):
	$".".rotate(rotationSpeed)
	

func _on_Timer_timeout():
	rotationSpeed=-rotationSpeed


