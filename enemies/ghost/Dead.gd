extends State

var gravity = 10
@onready var alive_collision = owner.get_node("alive_collision")
@onready var dead_collision = owner.get_node("dead_collision_area/dead_collision")
@onready var dead_collision_area = owner.get_node("dead_collision_area")

func enter(_msg := {}) -> void:
	owner.get_node("AnimationPlayer").play("dead")
	owner.get_node("TextureProgressBar").visible = false
	dead_collision.disabled = false
	alive_collision.disabled = true
	var m = owner.money.instantiate()
	get_tree().get_root().add_child(m)
	m.transform = owner.global_transform

func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if dead_collision_area.has_overlapping_bodies() == false:
		owner.position.y += + gravity * delta
