extends CharacterBody2D

signal change_to_knockback
signal change_to_dead

@export var health = 10
@export var direction_facing = "right"
@export var speed = 100.0
@export var hostile_speed = 3000.0
var dead = false

func _process(_delta):
	if health <= 0 and dead == false:
		emit_signal("change_to_dead")
		dead = true

func handle_hit(damage):
	if dead == false:
		health -= damage
		emit_signal("change_to_knockback")
