extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		body.take_damage(10)
