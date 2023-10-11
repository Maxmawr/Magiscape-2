# Run.gd
extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")

func enter(_msg := {}) -> void:
	animationplayer.play(owner.colour + "_walk")

func physics_update(delta: float) -> void:
	# Notice how we have some code duplication between states. That's inherent to the pattern,
	# although in production, your states will tend to be more complex and duplicate code
	# much more rare.
	if not owner.is_on_floor():
		state_machine.transition_to("Air")
		return

	# We move the run-specific input code to the state.
	# A good alternative would be to define a `get_input_direction()` function on the `Player.gd`
	# script to avoid duplicating these lines in every script.
	var input_direction_x: float = (
		Input.get_action_strength("moveright")
		- Input.get_action_strength("moveleft")
	)
	owner.velocity.x = owner.speed * input_direction_x
	if input_direction_x < 0:
		owner.get_node("sprite").flip_h = true
		Permavariables.direction_facing = "left"
	if input_direction_x > 0:
		owner.get_node("sprite").flip_h = false
		Permavariables.direction_facing = "right"
	owner.velocity.y += owner.gravity * delta
	owner.move_and_slide()

	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")
