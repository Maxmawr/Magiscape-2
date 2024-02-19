extends Area2D

var dead = false
var damage = 1
signal bind

@export var money : PackedScene

func vine_bind():
	emit_signal("bind")

func handle_hit(damage):
	if dead == false:
		dead = true
