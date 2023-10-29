extends State

var gravity = 10

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var area = get_parent().get_parent()
@onready var alive_collision = get_parent().get_parent().get_node("alive_collision")
@onready var dead_collision = get_parent().get_parent().get_node("dead_collision")

func enter(_msg := {}) -> void:
	area.dead = true
	dead_collision.disabled = false
	alive_collision.disabled = true
	animationplayer.play("dead")



func update(delta: float) -> void:
	if area.has_overlapping_bodies() == false:
		area.position.y += + gravity * delta
