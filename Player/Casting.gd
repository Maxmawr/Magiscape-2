extends State

signal mana_changed
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var spell_spawn = owner.get_node("spell_spawn")
@onready var mana = owner.get_node("manabar")

func enter(msg := {}) -> void:
	if msg.has("fireball"):
		fireball()
	animationplayer.play(owner.colour + "_cast")

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
	
	if input_direction_x < 0:
		owner.get_node("sprite").flip_h = true
		Permavariables.direction_facing = "left"
	if input_direction_x > 0:
		owner.get_node("sprite").flip_h = false
		Permavariables.direction_facing = "right"

func update(delta: float) -> void:
	if owner.health == 0:
		state_machine.transition_to("Dead")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == owner.colour + "_cast":
		state_machine.transition_to("Idle")

func fireball():
	owner.mana -= 50
	mana.mana_changed()
	var b = owner.fireball.instantiate()
	owner.owner.add_child(b)
	b.transform = spell_spawn.global_transform

