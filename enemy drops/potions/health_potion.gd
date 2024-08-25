extends Area2D



func _on_body_entered(body):
	if body.name == "player":
		Permavariables.health = 10
		queue_free()
