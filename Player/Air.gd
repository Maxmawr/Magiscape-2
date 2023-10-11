# Air.gd
extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")

# If we get a message asking us to jump, we jump.
func enter(msg := {}) -> void:
	animationplayer.play(owner.colour + "_jump")
	if msg.has("do_jump"):
		owner.velocity.y = -owner.jump_height


func physics_update(delta: float) -> void:
	# Horizontal movement.
	var input_direction_x: float = (
		Input.get_action_strength("moveright")
		- Input.get_action_strength("moveleft")
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
