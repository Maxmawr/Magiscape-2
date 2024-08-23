extends CharacterBody2D

@export var hostile_speed = 3000.0
@export var money : PackedScene
@export var projectile : PackedScene

@onready var bindnode = get_node("S_Boss_StateMachine/Bind")

var health = 30
var ground_speed := 300.0
var air_speed := 300.0
var jump_height := 500
var speed := 175.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 4
var direction_facing = "right"
var dead = false

func _process(_delta):
	if health <= 0 and dead == false:
		$S_Boss_StateMachine.transition_to("Dead")
		dead = true

func handle_hit(damage):
	if dead == false:
		health -= damage
		$S_Boss_StateMachine.transition_to("Knockback")

func vine_bind():
	print("bind")
	if dead == false:
		if $S_Boss_StateMachine.state == bindnode:
			bindnode.restart()
		else:
			$S_Boss_StateMachine.transition_to("Bind")
