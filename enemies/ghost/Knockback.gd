extends State

@onready var player = owner.get_parent().get_node("player")

func enter(_msg := {}) -> void:
	if owner.get_node("Knockback").current_animation not in "Knockback":
		owner.get_node("AnimationPlayer").play("RESET")
		owner.get_node("Knockback").play("Knockback")

func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var dir = (player.global_position - owner.global_position).normalized()
#	owner.velocity = owner.speed * dir * delta
	if player.global_position > owner.global_position:
		owner.velocity.x = owner.speed
	else:
		owner.velocity.x = owner.speed * -1

	owner.move_and_slide()


func _on_knockback_animation_finished(anim_name):
	if anim_name == "Knockback" and state_machine.state == self:
		state_machine.transition_to("Hostile")


func _on_ghost_change_to_dead():
	state_machine.transition_to("Dead")
