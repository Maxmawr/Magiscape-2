extends Area2D

@onready var box = $CollisionShape2D

func _process(_delta):
	if get_parent().direction_facing == "right":
		box.disabled = true
	elif get_parent().direction_facing == "left":
		box.disabled = false
