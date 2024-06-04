extends CollisionPolygon2D

func _process(_delta):
	if owner.direction_facing == "right":
		$cone.disabled = false
	elif owner.direction_facing == "left":
		$cone.disabled = true
