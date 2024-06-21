extends CharacterBody2D

@export var hostile_speed = 3000.0
@export var axe : PackedScene
@export var money : PackedScene

@onready var bindnode = get_node("Goblin_StateMachine/Bind")

var health = 1
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

func vine_bind():
	if dead == false:
		if $Goblin_StateMachine.state == bindnode:
			bindnode.restart()
		else:
			$Goblin_StateMachine.transition_to("Bind")
