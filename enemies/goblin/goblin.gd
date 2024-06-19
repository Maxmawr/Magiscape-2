extends CharacterBody2D

@export var hostile_speed = 3000.0
@export var axe : PackedScene

var health = 20
var ground_speed := 300.0
var air_speed := 300.0
var jump_height := 275.0
var speed := 175.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction_facing = "right"
var dead = false

func _process(_delta):
	if health <= 0 and dead == false:
		$Goblin_StateMachine.transition_to("Dead")
		dead = true

func handle_hit(damage):
	if dead == false:
		health -= damage
		$Goblin_StateMachine.transition_to("Knockback")
