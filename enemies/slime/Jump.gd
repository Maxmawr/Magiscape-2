extends State

@onready var player = owner.get_parent().get_node("player")
@onready var sprite = owner.get_node("Sprite2D")
#@onready var prog_bar = owner.get_node("TextureProgressBar")
@onready var timer = owner.get_node("jump_timer")

@onready var jump_dir = randi_range(1,2)

func enter(_msg := {}) -> void:
	owner.velocity.y = -owner.jump_height
	timer.start()


func update(_delta: float) -> void:
	if jump_dir == 1:
		sprite.flip_h = false
		owner.direction_facing = "right"
	else:
		sprite.flip_h = true
		owner.direction_facing = "left"

func physics_update(delta: float) -> void:
	if owner.is_on_floor() == false:
		if jump_dir == 1:
			owner.velocity.x = owner.speed * delta
		elif jump_dir == 2:
			owner.velocity.x = -owner.speed * delta
		
		owner.velocity.y += owner.gravity * delta
	else:
		owner.velocity.x = 0
	
	owner.move_and_slide()


func jump():
	owner.velocity.y = -owner.jump_height

func _on_jump_timer_timeout():
	jump_dir = randi_range(1,2)
	jump()
	timer.start()
	


func _on_collision_area_body_entered(body):
	if body.name == "player" and state_machine.state == self:
		player.take_damage(1, owner.global_position)
