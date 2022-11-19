extends Node2D


var charakter_hearth = 0
var is_menu_visible = false
var show := false

signal pause

func _ready():
	hide_gameOverUI()
	hide_controls()
	hide_menu()
	var buttons = $UI/menu/Buttons.get_children()
	buttons[2].connect("pressed", self, "open_scene", [buttons[2].open_scene])
	
func update_hearts():
	$UI/heartsUI/numOfHearts.text = String(charakter_hearth)


func _unhandled_key_input(event):
	if Input.is_action_pressed("ui_cancel"):
		if show == true:
			show = false
			hide_controls()
			return
		if is_menu_visible == false:
			is_menu_visible = true
			show_menu()
			emit_signal("pause", true)
		else:
			is_menu_visible = false
			hide_menu()
			emit_signal("pause", false)


func _on_Player_hearth_signal(number_of_hearth):
	charakter_hearth = number_of_hearth
	update_hearts()


func show_menu():
	var children = $UI/menu.get_children()
	
	for child in children:
		child.show()


func hide_menu():
	var children = $UI/menu.get_children()
	
	for child in children:
		child.hide()

func hide_gameOverUI():
	var children = $UI/gameOverUI.get_children()
	
	for child in children:
		child.hide()


func show_gameOverUI():
	var children = $UI/gameOverUI.get_children()
	
	for child in children:
		child.show()

func open_scene(path):
	get_tree().change_scene(path)


func _on_ResumeButton_button_up():
	is_menu_visible = false
	hide_menu()
	emit_signal("pause", false)


func _on_ControlsButton_button_up():
	show_controls()
	
func show_controls():
	hide_menu()
	show = true
	var children = $Node2D/UI/menu.get_children()
	
	for child in children:
		child.show()


func hide_controls():
	show_menu()
	show = false
	var children = $Node2D/UI/menu.get_children()
	
	for child in children:
		child.hide()


func _on_Player_game_over():
	show_gameOverUI()
	var timer = get_node("Timer")
	timer.start()



func _on_Timer_timeout():
	open_scene("res://scene/menu.tscn")
