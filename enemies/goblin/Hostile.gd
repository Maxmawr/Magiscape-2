extends State

@onready var player = owner.get_parent().get_node("player")
@onready var sprite = owner.get_node("Sprite2D")
@onready var attack_area = owner.get_node("attack_area")


func enter(_msg := {}) -> void:
	pass


func update(_delta: float) -> void:
	if player.global_position.x > owner.global_position.x:
		sprite.flip_h = false
		owner.direction_facing = "left"
	else:
		sprite.flip_h = true
		owner.direction_facing = "right"

	for body in attack_area.get_overlapping_bodies():
		if body.name == "player":
			state_machine.transition_to("Attacking")

func physics_update(delta: float) -> void:
	if player.global_position > owner.global_position:
		owner.velocity.x = owner.hostile_speed * delta
	else:
		owner.velocity.x = -owner.hostile_speed * delta
	
	owner.velocity.y += owner.gravity * delta
	
	owner.move_and_slide()
