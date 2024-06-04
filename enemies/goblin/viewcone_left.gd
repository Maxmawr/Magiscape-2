extends Area2D

func _process(_delta):
	if get_parent().direction_facing == "right":
		$cone.disabled = true
	elif get_parent().direction_facing == "left":
		$cone.disabled = false
