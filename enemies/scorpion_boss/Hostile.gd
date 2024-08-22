extends State

@onready var player = owner.get_parent().get_node("player")
@onready var attack_area = owner.get_node("attack_area")
@onready var melee_area = owner.get_node("melee_area")
@onready var melee_area_2 = owner.get_node("melee_area_2")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var sprite = owner.get_node("Sprite2D")

func enter(_msg := {}) -> void:
	animationplayer.play("walk")


func update(_delta: float) -> void:
	if player.global_position.x > owner.global_position.x:
		sprite.flip_h = false
		owner.direction_facing = "right"
	else:
		sprite.flip_h = true
		owner.direction_facing = "left"


	for body in melee_area.get_overlapping_bodies():
		if body.name == "player":
			state_machine.transition_to("Attacking", {melee = true})
			return
	for body in melee_area_2.get_overlapping_bodies():
		if body.name == "player":
			state_machine.transition_to("Attacking", {melee = true})
			return
	for body in attack_area.get_overlapping_bodies():
		if body.name == "player":
			state_machine.transition_to("Attacking")

func physics_update(delta: float) -> void:
	if player.global_position > owner.global_position:
		owner.velocity.x = owner.hostile_speed * delta
	else:
		owner.velocity.x = -owner.hostile_speed * delta

	if player.global_position > owner.global_position:
		owner.get_node("Sprite2D").flip_h = false
		owner.direction_facing = "right"
	else:
		owner.get_node("Sprite2D").flip_h = true
		owner.direction_facing = "left"
		
	owner.velocity.y += owner.gravity * delta
	
	owner.move_and_slide()
