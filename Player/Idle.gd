extends State


@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var spell_spawn = owner.get_node("spell_spawn")


func enter(_msg := {}) -> void:
	owner.velocity = Vector2.ZERO
	animationplayer.play(owner.colour + "_idle")

func update(_delta: float) -> void:
	if not owner.is_on_floor():
		state_machine.transition_to("Air")
		return

	if Permavariables.direction_facing == "left":
		owner.get_node("sprite").flip_h = true
		spell_spawn.position.x = -10

	elif Permavariables.direction_facing == "right":
		owner.get_node("sprite").flip_h = false
		spell_spawn.position.x = 10

	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})

	elif Input.is_action_pressed("moveleft") or Input.is_action_pressed("moveright"):
		state_machine.transition_to("Run")

	elif Input.is_action_pressed("cast") and Permavariables.mana >= Permavariables.current_spell_cost:
		state_machine.transition_to("Casting")
