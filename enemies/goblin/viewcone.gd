extends Area2D


func _process(delta):
	if owner.direction_facing == "right":
		scale.x = -1
	elif owner.direction_facing == "right":
		scale.x = 1
