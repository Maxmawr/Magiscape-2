extends State

@onready var player = owner.get_parent().get_node("player")
@onready var attack_area = owner.get_node("attack_area")

func enter(_msg := {}) -> void:
	pass


func update(_delta: float) -> void:
	for body in attack_area.get_overlapping_bodies():
		if body.name == "player":
			state_machine.transition_to("Attacking")

func physics_update(delta: float) -> void:
	var dir = (player.global_position - owner.global_position).normalized()
	owner.velocity = owner.hostile_speed * dir * delta
	if player.global_position > owner.global_position:
		owner.get_node("Sprite2D").flip_h = false
		owner.direction_facing = "right"
	else:
		owner.get_node("Sprite2D").flip_h = true
		owner.direction_facing = "left"
	owner.move_and_slide()
