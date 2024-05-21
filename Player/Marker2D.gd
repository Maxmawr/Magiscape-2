extends Marker2D


func _process(delta):
	if Permavariables.direction_facing == "left":
		self.position.x = 8
	elif Permavariables.direction_facing == "right":
		self.position.x = 0
