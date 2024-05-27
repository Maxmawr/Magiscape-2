extends Area2D

@export var launch_height = -500

func _on_body_entered(body):
	if body.name == "player":
		print("ihawuthoawt")
		body.velocity.y = -500
