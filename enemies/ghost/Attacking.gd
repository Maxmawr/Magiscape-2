extends State

@onready var canhit = true
@onready var player = owner.get_parent().get_node("player")
@onready var attackbox_right = owner.get_node("attackbox_right")
@onready var attackbox_left = owner.get_node("attackbox_left")
@onready var collision_detector = owner.get_node("collision_detector")
@onready var attack_area_left = owner.get_node("attackbox_left/CollisionShape2D")
@onready var attack_area_right = owner.get_node("attackbox_right/CollisionShape2D")

func enter(_msg := {}) -> void:
	owner.hostile_speed = 3000
	owner.get_node("AnimationPlayer").play("attack")
	if owner.direction_facing == "right":
		call_deferred("disable_left")
		call_deferred("enable_right")
	elif owner.direction_facing == "left":
		call_deferred("disable_right")
		call_deferred("enable_left")

func update(_delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var dir = (player.global_position - owner.global_position).normalized()
	owner.velocity = owner.hostile_speed * dir * delta
#	if player.global_position > owner.global_position:
#		owner.get_node("Sprite2D").flip_h = false
#	else:
#		owner.get_node("Sprite2D").flip_h = true

	owner.move_and_slide()

func attack():
	if canhit == true:
		player.take_damage(2)
	else:
		return


func _on_attackbox_right_body_entered(body):
	if state_machine.state == self:
		if body.name == "player":
			canhit = true


func _on_attackbox_right_body_exited(body):
	if state_machine.state == self:
		if body.name == "player":
			canhit = false


func _on_attackbox_left_body_entered(body):
	if state_machine.state == self:
		if body.name == "player":
			canhit = true


func _on_attackbox_left_body_exited(body):
	if state_machine.state == self:
		if body.name == "player":
			canhit = false


func _on_animation_player_animation_finished(anim_name):
	if state_machine.state == self:
		if anim_name == "attack":
			state_machine.transition_to("Hostile")
			print("weagag")

func disable_left():
	attack_area_left.disabled = true

func enable_left():
	attack_area_left.disabled = false

func disable_right():
	attack_area_right.disabled = true

func enable_right():
	attack_area_right.disabled = false
