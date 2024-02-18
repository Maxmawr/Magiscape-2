extends Area2D

@export var laser : PackedScene
@export var money : PackedScene

var health = 5
var dead = false
signal change_to_dead

func _process(_delta):
	if health <= 0 and dead == false:
		emit_signal("change_to_dead")
		print("ow")
		dead = true

func handle_hit(damage):
	if dead == false:
		health -= damage
