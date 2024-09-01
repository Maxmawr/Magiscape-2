extends Control

var materials_size = len(ParticlesCache.materials)
var current_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().change_scene_to_file("res://GUI/main_menu.tscn")
	#ParticlesCache.load_particles()
	#get_tree().change_scene_to_file("res://GUI/main_menu.tscn")

func _process(delta: float) -> void:
		for material in ParticlesCache.materials:
			if current_pos == materials_size:
				get_tree().change_scene_to_file("res://GUI/main_menu.tscn")
			else:
				var particles_instance = GPUParticles2D.new()
				particles_instance.set_process_material(material)
				particles_instance.set_one_shot(true)
				particles_instance.set_modulate(Color(1,1,1,0))
				particles_instance.set_emitting(true)
				self.add_child(particles_instance)
				current_pos += 1
				print(current_pos)
				$TextureProgressBar.value = int((float(current_pos) / materials_size) * 100)
 
