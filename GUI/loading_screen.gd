extends Control

var materials_size = len(ParticlesCache.materials)
var current_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(materials_size)

func _process(delta: float) -> void:
	ParticlesCache.load_particles(current_pos)
	current_pos += 1
	$TextureProgressBar.value = int((float(current_pos) / materials_size) * 100)
	if current_pos == materials_size:
		get_tree().change_scene_to_file("res://GUI/main_menu.tscn")
