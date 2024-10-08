extends Control

var is_paused = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pause_unpause()

func pause_unpause():
	if is_paused == false:
		is_paused = true
		self.visible = true
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif is_paused == true:
		is_paused = false
		self.visible = false
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_resume_btn_pressed():
	pause_unpause()


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_options_btn_pressed() -> void:
	$keybinds.visible = true
