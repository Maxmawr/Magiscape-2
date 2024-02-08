extends Control

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://GUI/character_select.tscn")
