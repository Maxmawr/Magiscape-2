extends State

var current_spell
signal mana_changed
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var spell_spawn = owner.get_node("spell_spawn")
@onready var mana = owner.get_node("manabar")

func enter(_msg := {}) -> void:
	#current_spell = msg
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

func update(_delta: float) -> void:
	if Permavariables.health == 0:
		state_machine.transition_to("Dead")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == owner.colour + "_cast":
		state_machine.transition_to("Idle")

func fireball():
	Permavariables.mana -= 50
	var b = owner.fireball.instantiate()
	b.transform = spell_spawn.global_transform
	owner.owner.add_child(b)


func vinespell():
	Permavariables.mana -= 25
	var b = owner.vinespell.instantiate()
	b.transform = spell_spawn.global_transform
	owner.owner.add_child(b)

func handle_spell():
	if Permavariables.current_spell == 0:
		fireball()
	elif Permavariables.current_spell == 1:
		vinespell()
