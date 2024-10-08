extends CanvasLayer

var potionparticles = preload("res://Materials/potion_particles.tres")
var fireballparticles = preload("res://Materials/fireball_particles.tres")
var vinespellparticles = preload("res://Materials/vinespell_particles.tres")
var cauldronsteam = preload("res://Materials/cauldron_steam_particles.tres")
var cauldronbubbles = preload("res://Materials/cauldron_bubble_particles.tres")
var lightningparticles = preload("res://Materials/lighting_particles.tres")
var lightningparticles_s = preload("res://Materials/small_lightning_particles.tres")

var materials = [
	potionparticles,
	fireballparticles,
	vinespellparticles,
	cauldronsteam,
	cauldronbubbles,
	lightningparticles,
	lightningparticles_s
]

#var materials_size = len(materials)
#var current_pos = 0
#
#
func load_particles(num):
	var particles_instance = GPUParticles2D.new()
	particles_instance.set_process_material(materials[num])
	particles_instance.set_one_shot(true)
	particles_instance.set_modulate(Color(1,1,1,0))
	particles_instance.set_emitting(true)
	self.add_child(particles_instance)
