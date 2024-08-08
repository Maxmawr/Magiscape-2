extends State


func enter(msg := {}) -> void:
	owner.velocity.y = -200
	if msg.has("left"):
		owner.velocity.x = -200
		print("rehheehe")
	else:
		owner.velocity.x = 200
	print(msg)


func update(_delta: float) -> void:
	if owner.is_on_floor() == true:
		state_machine.transition_to("Idle")

func physics_update(delta: float) -> void:
	owner.velocity.y += owner.gravity * delta
	owner.move_and_slide()
