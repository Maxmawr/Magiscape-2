extends TextureButton

func _on_mouse_entered():
	$AnimationPlayer.play("grow")


func _on_mouse_exited():
	$AnimationPlayer.play("shrink")


func _on_pressed():
	Permavariables.colour = "blue"
	get_tree().change_scene_to_file("res://Levels/level_4.tscn")
