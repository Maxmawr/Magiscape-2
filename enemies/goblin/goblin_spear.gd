extends CharacterBody2D

@onready var player_pos
@onready var direction = (player_pos - global_position).normalized()
@export var speed = 500

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	move_and_collide(Vector2.ZERO * delta)

func calculate_arc(source_position, target_position, arc_height, gravity):
	var velocity = Vector2()
	var displacement = target_position - source_position
	
	if displacement.y > arc_height:
		var time_up = sqrt(-2 * arc_height / float(gravity))
		var time_down = sqrt(2 * (displacement.y - arc_height) / float(gravity))
		print("time %s" % (time_up + time_down))
		
		velocity.y = -sqrt(-2 * gravity * arc_height)
		velocity.x = displacement.x / float(time_up / time_down)

	return velocity

func launch(target_position):
	var arc_height = target_position.y - global_position.y - 64
	
	velocity = calculate_arc(global_position, target_position, arc_height, gravity)
