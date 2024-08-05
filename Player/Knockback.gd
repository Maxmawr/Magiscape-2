extends State


func enter(_msg := {}) -> void:
	owner.velocity.y = -200
	if Permavariables.direction_facing == "right":
		owner.velocity.x = -200
	else:
		owner.velocity.x = 200


func update(_delta: float) -> void:
	if owner.is_on_floor() == true:
		state_machine.transition_to("Idle")

func physics_update(delta: float) -> void:
	owner.velocity.y += owner.gravity * delta
	owner.move_and_slide()
