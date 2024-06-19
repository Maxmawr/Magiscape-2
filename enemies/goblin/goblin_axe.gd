extends CharacterBody2D


@onready var goblin = get_parent().get_node("goblin")

@export var speed = 500

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if goblin.direction_facing == "left":
		position.x += -10

func _physics_process(delta):
	velocity.y += gravity * delta
	
	move_and_collide(velocity * delta)
	rotation = velocity.angle()

func _process(_delta):
	pass

func calculate_arc_velocity(source_position, target_position, arc_height, gravity):
	var velocity = Vector2()
	var displacement = target_position - source_position
	
	if displacement.y > arc_height:
		var time_up = sqrt(-2 * arc_height / float(gravity))
		var time_down = sqrt(2 * (displacement.y - arc_height) / float(gravity))
		print("time %s" % (time_up + time_down))
		if goblin.direction_facing == "left":
			velocity.y = -sqrt(-2 * gravity * arc_height)
			velocity.x = displacement.x / (time_up + time_down)
			scale.y = -1
		else:
			velocity.y = -sqrt(-2 * gravity * arc_height)
			velocity.x = displacement.x / (time_up + time_down)
	
	return velocity

func launch(target_position):
	var arc_height = target_position.y - global_position.y - 48
	
	velocity = calculate_arc_velocity(global_position, target_position, arc_height, gravity)


func _on_hitbox_body_entered(body):
	if body.name == "player":
		body.take_damage(5)
		queue_free()
	elif body.is_in_group("wall"):
		queue_free()
