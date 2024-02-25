extends Control

func _ready():
	Music.play_file("res://Music/Adventure(CodeManu).mp3")

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://GUI/character_select.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()
