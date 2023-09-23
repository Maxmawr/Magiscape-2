extends CharacterBody2D
class_name Player

@export var jump_speed = 275
var falling = false
var direction = Vector2.RIGHT
var speed = 125
var jump_impulse = 200
var gravity = 800.0
var colour = Permavariables.colour
var casting = false

func _ready():
	print("hello")

func _physics_process(delta):
	var move_direction = 0
	if Input.is_action_pressed("moveleft"):
		move_direction -= 1
		direction = Vector2.LEFT
	if Input.is_action_pressed("moveright"):
		move_direction += 1
		direction = Vector2.RIGHT

	velocity.x = move_direction * speed
	set_velocity(velocity)
	move_and_slide()
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_impulse
		falling = true

	if is_on_floor():
		falling = false

	velocity.y += gravity * delta

func _process(_delta):
	if casting == false:
		if Input.is_action_just_pressed("spell1"):
			print("watujiohaw32")
			firespell()
		if not is_on_floor():
			$AnimationPlayer.play(colour + "_jump")
			if Input.is_action_pressed("moveleft"):
				$sprite.set_flip_h(true)
			elif Input.is_action_pressed("moveright"):
				$sprite.set_flip_h(false)
		elif Input.is_action_pressed("moveleft"):
			$AnimationPlayer.play(colour + "_walk")
			$sprite.set_flip_h(true)
		elif Input.is_action_pressed("moveright"):
			$AnimationPlayer.play(colour + "_walk")
			$sprite.set_flip_h(false)
		else:
			$AnimationPlayer.stop()
			$AnimationPlayer.play(colour + "_idle")


func firespell():
	$AnimationPlayer.play(colour + "_cast")
	casting == true
