extends Node

var health = 10
var mana = 100
var colour = "blue"
var direction_facing = "right"
var current_spell = 0
var current_spell_cost = 50

func reset():
	health = 10
	mana = 100

func _process(delta):
	if current_spell == 0:
		current_spell_cost = 50
	elif current_spell == 1:
		current_spell_cost = 20
	elif current_spell == 2:
		current_spell_cost = 20
