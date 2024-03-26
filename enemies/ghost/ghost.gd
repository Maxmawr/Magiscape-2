extends CharacterBody2D

signal change_to_knockback
signal change_to_dead
signal bind

@export var money : PackedScene
@export var health = 10
@export var direction_facing = "right"
@export var speed = 100.0
@export var hostile_speed = 3000.0
var dead = false

func _process(_delta):
	if health <= 0 and dead == false:
		emit_signal("change_to_dead")
		dead = true

	# Handles ghost becoming slightly transparent when inside a wall
	if dead == false:
		for body in $collision_detector.get_overlapping_bodies():
			if body.is_in_group("wall"):
				modulate = Color("ffffffaf")
			else:
				modulate = Color("ffffff")
		if $collision_detector.get_overlapping_bodies() == []:
			modulate = Color("ffffff")

func handle_hit(damage):
	if dead == false:
		health -= damage
		emit_signal("change_to_knockback")

func vine_bind():
	if dead == false:
		emit_signal("bind")
