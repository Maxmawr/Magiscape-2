extends Area2D


func _on_body_entered(body):
	if body.name == "player" and get_parent().name == "Level 1":
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")
