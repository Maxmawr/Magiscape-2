extends CharacterBody2D

var health = 10
var jump_height := 200
var speed := 3000
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction_facing = "right"
var dead = false

@export var money : PackedScene

func _process(_delta):
	if health <= 0 and dead == false:
		$Slime_StateMachine.transition_to("Dead")
		dead = true


func handle_hit(damage):
	if dead == false:
		health -= damage
		$Slime_StateMachine.transition_to("Knockback")
