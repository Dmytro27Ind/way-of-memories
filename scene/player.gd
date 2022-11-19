extends KinematicBody2D


var motion = Vector2(0,0)
const UP = Vector2(0,-1)
export var speed = 200
export var jump_speed = 200
export var gravity = 5

var was_jump = false

var number_of_hearth = 3
var is_game_on_pause = false
var last_checkpoint_pos;

signal animate
signal hearth_signal
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	last_checkpoint_pos = position


func _physics_process(delta):
	if(is_game_on_pause == false):
		send_num_of_hearth()
		apply_gravity()
		jump()
		move()
		
		move_and_slide(motion, UP)
		animate()
		
		if position.y > 1000:
			to_last_checkpoint()
			decrease_num_of_hearts()
		
		if is_on_floor():
			was_jump = false

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
	if Input.is_action_just_pressed("ui_up") and was_jump == false:
		motion.y = -jump_speed
		was_jump = true


func apply_gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	else:
		motion.y += gravity


func increase_num_of_hearts():
	number_of_hearth = number_of_hearth + 1


func decrease_num_of_hearts():
	number_of_hearth = number_of_hearth - 1
	if number_of_hearth < 1:
		emit_signal("game_over")


func animate():
	emit_signal("animate", motion)


func send_num_of_hearth():
	emit_signal("hearth_signal", number_of_hearth)



func _on_Heart_heart_collect():
	increase_num_of_hearts()


func _on_levelUI_pause(pause):
	is_game_on_pause = pause


func _on_checkPoint_checkpoint_pos(position):
	last_checkpoint_pos = position


func to_last_checkpoint():
	position = last_checkpoint_pos




func _on_KinematicBody2D_trap():
	decrease_num_of_hearts()
	to_last_checkpoint()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		decrease_num_of_hearts()
		to_last_checkpoint()

