# Idle.gd
extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	# We must declare all the properties we access through `owner` in the `Player.gd` script.
	owner.velocity = Vector2.ZERO
	animationplayer.play(owner.colour + "_idle")

func update(delta: float) -> void:
	# If you have platforms that break when standing on them, you need that check for 
	# the character to fall.
	if not owner.is_on_floor():
		state_machine.transition_to("Air")
		return

	if Input.is_action_just_pressed("jump"):
		# As we'll only have one air state for both jump and fall, we use the `msg` dictionary 
		# to tell the next state that we want to jump.
		state_machine.transition_to("Air", {do_jump = true})
	elif Input.is_action_pressed("moveleft") or Input.is_action_pressed("moveright"):
		state_machine.transition_to("Run")
	elif Input.is_action_pressed("fireball"):
		state_machine.transition_to("Casting", {fireball = true})
