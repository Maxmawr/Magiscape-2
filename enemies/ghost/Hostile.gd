extends State

@onready var player = owner.get_parent().get_node("player")
@onready var attackbox_right = owner.get_node("attackbox_right")
@onready var attackbox_left = owner.get_node("attackbox_left")
@onready var collision_detector = owner.get_node("collision_detector")
@onready var attack_area_left = owner.get_node("attackbox_left/CollisionShape2D")
@onready var attack_area_right = owner.get_node("attackbox_right/CollisionShape2D")
@onready var dead = owner.get_node("Ghost_StateMachine/Dead")


func enter(msg := {}) -> void:
	if owner.dead == false:
		owner.hostile_speed = 3000
		owner.get_node("AnimationPlayer").play("moving")
	else:
		state_machine.transition_to("dead")

func update(_delta: float) -> void:
	if owner.direction_facing == "right":
		attack_area_left.disabled = true
		attack_area_right.disabled = false
	elif owner.direction_facing == "left":
		attack_area_right.disabled = true
		attack_area_left.disabled = false

func physics_update(delta: float) -> void:
	var dir = (player.global_position - owner.global_position).normalized()
	owner.velocity = owner.hostile_speed * dir * delta
	if player.global_position > owner.global_position:
		owner.get_node("Sprite2D").flip_h = false
		owner.direction_facing = "right"
	else:
		owner.get_node("Sprite2D").flip_h = true
		owner.direction_facing = "left"
	owner.move_and_slide()

func _on_attackbox_right_body_entered(body):
	if state_machine.state == self:
		if body.name == "player":
			state_machine.transition_to("Attacking")


func _on_attackbox_left_body_entered(body):
	if state_machine.state == self:
		if body.name == "player":
			state_machine.transition_to("Attacking")
