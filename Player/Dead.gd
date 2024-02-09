extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")

func enter(_msg := {}) -> void:
	owner.velocity.x = 0
	animationplayer.play(owner.colour + "_dead")
	owner.get_node("death_text").visible = true

func physics_update(delta: float) -> void:
	owner.velocity.y += owner.gravity * delta
	owner.move_and_slide()

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		Permavariables.reset()
