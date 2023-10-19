extends State

var thispos
@onready var lastpos = owner.progress

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var area = get_parent().get_parent()

@export var speed = 0.5

func physics_update(delta: float) -> void:
	owner.progress_ratio += delta * speed

func enter(_msg := {}) -> void:
	animationplayer.play("flying")

func update(delta: float) -> void:
	thispos = owner.progress
#	if thispos > lastpos:
#		owner.get_node("sprite").flip_h = false
#	else:
#		owner.get_node("sprite").flip_h = true
#	lastpos = thispos
	if area.dead == true:
		state_machine.transition_to("Dead")
