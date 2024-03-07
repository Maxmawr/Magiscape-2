extends Control

@export var icon_list = []


# Called when the node enters the scene tree for the first time.
func _ready():
	$icon.set_texture(icon_list[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("cycle_spell_l"):
		Permavariables.current_spell -= 1
		num_loop()
		$icon.set_texture(icon_list[Permavariables.current_spell])
	elif Input.is_action_just_pressed("cycle_spell_r"):
		Permavariables.current_spell += 1
		num_loop()
		$icon.set_texture(icon_list[Permavariables.current_spell])

func num_loop():
	if Permavariables.current_spell < 0:
		Permavariables.current_spell = 1
	elif Permavariables.current_spell > 1:
		Permavariables.current_spell = 0
