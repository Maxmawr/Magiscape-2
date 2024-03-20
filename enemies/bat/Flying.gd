extends State

var thispos
@onready var lastpos = owner.global_position

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var area = get_parent().get_parent()
@onready var alive_collision = get_parent().get_parent().get_node("alive_collision")
@onready var dead_collision = get_parent().get_parent().get_node("dead_collision")

@export var speed = 180

func physics_update(delta: float) -> void:
	owner.progress += delta * speed

func enter(_msg := {}) -> void:
	dead_collision.disabled = true
	alive_collision.disabled = false
	animationplayer.play("flying")

func update(_delta: float) -> void:
	thispos = owner.global_position
	if thispos > lastpos:
		owner.get_node("bat/sprite").flip_h = false
	elif thispos < lastpos:
		owner.get_node("bat/sprite").flip_h = true
	lastpos = thispos
	
	if area.dead == true:
		state_machine.transition_to("Dead")


func _on_bat_bind():
	state_machine.transition_to("Bind")


func _on_bat_body_entered(body):
	if body.name == "player" and state_machine.state == self:
		body.take_damage(area.damage)
