extends Control

var is_paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pass

func pausemenu():
	if is_paused:
		self.hide()
		get_tree().paused = true
