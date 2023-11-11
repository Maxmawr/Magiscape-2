extends State

var thispos
@onready var lastpos = owner.progress

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var area = get_parent().get_parent()
@onready var alive_collision = get_parent().get_parent().get_node("alive_collision")
@onready var dead_collision = get_parent().get_parent().get_node("dead_collision")

@export var speed = 0.5

func physics_update(delta: float) -> void:
	owner.progress_ratio += delta * speed

func enter(_msg := {}) -> void:
	dead_collision.disabled = true
	alive_collision.disabled = false
	animationplayer.play("flying")

func update(_delta: float) -> void:
	thispos = owner.progress
#	if thispos > lastpos:
#		owner.get_node("sprite").flip_h = false
#	else:
#		owner.get_node("sprite").flip_h = true
#	lastpos = thispos
	if area.dead == true:
		state_machine.transition_to("Dead")
