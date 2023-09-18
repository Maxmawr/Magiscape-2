extends CharacterBody2D
class_name Player

@export var jump_speed = 275
var falling = false
var direction = Vector2.RIGHT
var speed = 500.0
var jump_impulse = 1200.0
var gravity = 4000.0

func _physics_process(delta: float) -> void:
	var move_direction = 0
	if Input.is_action_pressed("moveleft"):
		move_direction -= 1
		direction = Vector2.LEFT
	if Input.is_action_pressed("moveright"):
		move_direction += 1
		direction = Vector2.RIGHT

	velocity.x = move_direction * speed
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_speed
		falling = true

	if is_on_floor():
		falling = false

	velocity.y += gravity * delta
