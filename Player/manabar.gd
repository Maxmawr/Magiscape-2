extends TextureProgressBar


func mana_changed():
	self.value = get_parent().mana
