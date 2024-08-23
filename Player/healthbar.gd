extends TextureProgressBar


func _process(delta):
	max_value = Permavariables.maxhealth
	self.value = Permavariables.health
