extends Control


var max_move := 55
var screen_center := Vector2.ZERO
var show = false

func _ready():
	hide_menu()
	
	var buttons := $Buttons.get_children()
	buttons[0].connect("pressed", self, "open_scene", [buttons[0].open_scene])
	
	var rect = get_viewport_rect()
	screen_center = rect_position + (rect.size / 2)


func _process(delta):
	var dist_mouse = ((get_global_mouse_position() - screen_center)).clamped(max_move)
	rect_global_position = lerp(rect_global_position, dist_mouse, delta*2)

func open_scene(path):
	get_tree().change_scene(path)
	
func _unhandled_key_input(event):
	if Input.is_action_pressed("ui_cancel"):
		if show == false:
			get_tree().quit()
		else:
			hide_menu()


func _on_ControlsButton_button_up():
	show_menu()


func show_menu():
	show = true
	var children = $Buttons/ControlsButton/Node2D/UI/menu.get_children()
	
	for child in children:
		child.show()


func hide_menu():
	show = false
	var children = $Buttons/ControlsButton/Node2D/UI/menu.get_children()
	
	for child in children:
		child.hide()
