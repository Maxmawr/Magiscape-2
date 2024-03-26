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

func take_damage(damage):
	Permavariables.health -= damage
	$healthbar.health_changed()
	$hurt.play()
	if Permavariables.health <= 0:
		$StateMachine.transition_to("Dead")

func change_state(state):
	if state == "Get_Item":
		statemachine.transition_to("Get_Item")
