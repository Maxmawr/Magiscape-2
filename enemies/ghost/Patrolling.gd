extends State

@onready var patrol_left = get_parent().get_parent().get_node("patrol_left/CollisionShape2D")
@onready var patrol_right = get_parent().get_parent().get_node("patrol_right/CollisionShape2D")

func enter(_msg := {}) -> void:
	owner.speed = 100
	owner.get_node("AnimationPlayer").play("moving")

func update(_delta: float) -> void:
	if owner.direction_facing == "right":
		patrol_left.disabled = true
		patrol_right.disabled = false
		owner.get_node("Sprite2D").flip_h = false
	elif owner.direction_facing == "left":
		patrol_left.disabled = false
		patrol_right.disabled = true
		owner.get_node("Sprite2D").flip_h = true

func physics_update(_delta: float) -> void:
	if owner.direction_facing == "right":
		owner.velocity.x = owner.speed
	elif owner.direction_facing == "left":
		owner.velocity.x = -owner.speed
	owner.move_and_slide()


func _on_patrol_left_body_entered(body):
	if body.is_in_group("wall"):
		owner.direction_facing = "right"


func _on_patrol_right_body_entered(body):
	if body.is_in_group("wall"):
		owner.direction_facing = "left"


func _on_sight_area_body_entered(body):
	if body.name == "player":
		state_machine.transition_to("Hostile")


func _on_ghost_change_to_knockback():
	state_machine.transition_to("Knockback")


func _on_ghost_change_to_dead():
	state_machine.transition_to("Dead")
