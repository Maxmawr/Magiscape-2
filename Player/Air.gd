# Air.gd
extends State


# If we get a message asking us to jump, we jump.
func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		owner.velocity.y = -owner.jump_impulse


func physics_update(delta: float) -> void:
	# Horizontal movement.
	var input_direction_x: float = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	owner.velocity.x = owner.speed * input_direction_x
	# Vertical movement.
	owner.velocity.y += owner.gravity * delta
	owner.move_and_slide()

	# Landing.
	if owner.is_on_floor():
		if is_equal_approx(owner.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
