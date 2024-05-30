extends Area2D


func _process(_delta):
	if owner.direction_facing == "right":
		scale.x = 1
	elif owner.direction_facing == "right":
		scale.x = -1
