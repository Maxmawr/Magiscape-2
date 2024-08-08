extends CharacterBody2D

@onready var statemachine = $StateMachine

var ground_speed := 300.0
var air_speed := 300.0
var jump_height := 275.0
var speed := 175.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var colour = Permavariables.colour
@export var fireball : PackedScene
@export var vinespell : PackedScene
@export var lightning_bolt : PackedScene
@onready var crosshair_angle

func take_damage(damage, enemy_pos):
	if $damage_flash.current_animation != "flash":
		Permavariables.health -= damage
		$hurt.play()
		if Permavariables.health <= 0:
			statemachine.transition_to("Dead")
		else:
			if global_position > enemy_pos:
				statemachine.transition_to("Knockback")
			else:
				statemachine.transition_to("Knockback", {left = true})
			$damage_flash.play("flash")

func change_state(state):
	if state == "Get_Item":
		statemachine.transition_to("Get_Item")
