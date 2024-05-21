extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var arm_sprite = owner.get_node("Marker2D/arm/arm_sprite")

func enter(_msg := {}) -> void:
	owner.velocity.x = 0
	animationplayer.play(owner.colour + "_dead")
	owner.get_node("death_text").visible = true
	arm_sprite.visible = false

func physics_update(delta: float) -> void:
	owner.velocity.y += owner.gravity * delta
	owner.move_and_slide()

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		Permavariables.reset()
