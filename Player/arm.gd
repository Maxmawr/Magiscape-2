extends Sprite2D

func _ready():
	if Permavariables.colour == "blue":
		frame = 0
	elif Permavariables.colour == "brown":
		frame = 1
	elif Permavariables.colour == "dark":
		frame = 2
	elif Permavariables.colour == "green":
		frame = 3
	elif Permavariables.colour == "red":
		frame = 4
	elif Permavariables.colour == "yellow":
		frame = 5
func _process(_delta):
	look_at(get_global_mouse_position())
	rotation_degrees -= 90
