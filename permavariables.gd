extends Node

var health = 10
var mana = 100
var maxhealth = 10
var maxmana = 100
var colour = "blue" #  Default for debug purposes; eg starting a scene without doing lvl select
var direction_facing = "right"
var current_spell = 0
var current_spell_cost = 50
var has_lightning = false
var crosshair_position
var gold_amount

func reset():
	current_spell = 0
	health = maxhealth
	mana = maxmana

func _process(_delta):
	if current_spell == 0:
		current_spell_cost = 50
	elif current_spell == 1:
		current_spell_cost = 20
	elif current_spell == 2:
		current_spell_cost = 20
	
	if mana > maxmana:
		mana = maxmana
	if health > maxhealth:
		health = maxhealth
