extends TextureProgressBar


func health_changed():
	self.value = Permavariables.health


func _on_collision_detector_area_entered(area):
	if area.is_in_group("enemies"):
		if area.dead == true:
			return
		else:
			Permavariables.health -= area.damage
			health_changed()
