extends State

var gravity = 10
@onready var alive_collision = owner.get_node("alive_collision")
@onready var dead_collision = owner.get_node("dead_collision_area/dead_collision")
@onready var dead_collision_area = owner.get_node("dead_collision_area")

func enter(_msg := {}) -> void:
	owner.get_node("AnimationPlayer").play("dead")
	dead_collision.disabled = false
	alive_collision.disabled = true

func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if dead_collision_area.has_overlapping_bodies() == false:
		owner.position.y += + gravity * delta


#func _on_animation_player_animation_finished(anim_name):
	#if anim_name == "dead":
		#queue_free()
