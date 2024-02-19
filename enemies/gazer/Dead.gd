extends State

var gravity = 100

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var alive_collision = get_parent().get_parent().get_node("alive_collision")
@onready var dead_collision = get_parent().get_parent().get_node("dead_collision")

func enter(_msg := {}) -> void:
	owner.dead = true
	owner.get_node("TextureProgressBar").visible = false
	dead_collision.disabled = false
	alive_collision.disabled = true
	animationplayer.play("dead")
	var m = owner.money.instantiate()
	get_tree().get_root().add_child(m)
	m.transform = owner.global_transform



func update(delta: float) -> void:
	if owner.has_overlapping_bodies() == false:
		owner.position.y += + gravity * delta
