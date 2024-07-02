extends State

@onready var player = owner.get_parent().get_node("player")
@onready var sprite = owner.get_node("Sprite2D")
@onready var attack_area = owner.get_node("attack_area")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var jump_left = owner.get_node("jump_detector_left")
@onready var jump_right = owner.get_node("jump_detector_right")
@onready var throw_cooldown = owner.get_node("throw_cooldown")


func enter(_msg := {}) -> void:
	animationplayer.play("move")


func update(_delta: float) -> void:
	if player.global_position.x > owner.global_position.x:
		sprite.flip_h = false
		owner.direction_facing = "right"
	else:
		sprite.flip_h = true
		owner.direction_facing = "left"

	for body in attack_area.get_overlapping_bodies():
		if body.name == "player" and throw_cooldown.time_left == 0:
			state_machine.transition_to("Attacking")


	for body in jump_left.get_overlapping_bodies():
		if body.is_in_group("wall"):
			state_machine.transition_to("Jump")
	
	for body in jump_right.get_overlapping_bodies():
		if body.is_in_group("wall"):
			state_machine.transition_to("Jump")


func physics_update(delta: float) -> void:
	if player.global_position > owner.global_position:
		owner.velocity.x = owner.hostile_speed * delta
	else:
		owner.velocity.x = -owner.hostile_speed * delta
	
	owner.velocity.y += owner.gravity * delta
	
	owner.move_and_slide()


func _on_jump_detector_left_body_entered(body):
	if state_machine.state == self and body.is_in_group("wall"):
		print("left")
		state_machine.transition_to("Jump")


func _on_jump_detector_right_body_entered(body):
	if state_machine.state == self and body.is_in_group("wall"):
		print("right")
		state_machine.transition_to("Jump")
