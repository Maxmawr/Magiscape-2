extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_keybind_pressed() -> void:
	$keybinds.visible = true


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://GUI/main_menu.tscn")
