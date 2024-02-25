extends Node2D


func _on_button_pressed():
	get_tree().change_scene_to_file("res://GUI/main_menu.tscn")
	Permavariables.reset()
