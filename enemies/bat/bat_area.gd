extends Area2D

var dead = false
var damage = 1
signal bind

func vine_bind():
	emit_signal("bind")
