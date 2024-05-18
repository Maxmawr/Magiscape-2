extends Area2D

@onready var fade_out = get_parent().get_node("fade_out")

func _on_body_entered(body):
	if body.name == "player":
		fade_out.start()



func _on_fade_out_change_level():
	if get_parent().name == "Level 1":
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")
	elif get_parent().name == "Level 2":
		get_tree().change_scene_to_file("res://Levels/level_3.tscn")
	elif get_parent().name == "Level 3":
		get_tree().change_scene_to_file("res://Levels/final_screen.tscn")
