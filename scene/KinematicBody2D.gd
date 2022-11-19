extends KinematicBody2D


var motion = Vector2(0,0)
const UP = Vector2(0,-1)
export var speed = 100
export var jump_speed = 50
export var gravity = 1


signal animate


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	apply_gravity()
	move()
	jump()
	move_and_slide(motion, UP)
	animate()

func move():
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		motion.x = 0
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
	else:
		motion.x = 0


func jump():
	if Input.is_action_just_pressed("ui_up"):
		motion.y = -jump_speed


func apply_gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	else:
		motion.y += gravity


func animate():
	emit_signal("animate", motion)
