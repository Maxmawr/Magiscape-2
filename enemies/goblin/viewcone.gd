extends Area2D

@onready var cone = $cone

func _process(_delta):
	if get_parent().direction_facing == "right":
		cone.disabled = false
	elif get_parent().direction_facing == "left":
		cone.disabled = true
