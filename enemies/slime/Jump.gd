extends State

@onready var player = owner.get_parent().get_node("player")
@onready var sprite = owner.get_node("Sprite2D")
#@onready var prog_bar = owner.get_node("TextureProgressBar")
@onready var timer = owner.get_node("jump_timer")

func enter(_msg := {}) -> void:
	owner.velocity.y = -owner.jump_height


func update(_delta: float) -> void:
	if player.global_position.x > owner.global_position.x:
		sprite.flip_h = false
		owner.direction_facing = "right"
	else:
		sprite.flip_h = true
		owner.direction_facing = "left"

func physics_update(delta: float) -> void:
	if player.global_position > owner.global_position:
		owner.velocity.x = owner.speed * delta
	else:
		owner.velocity.x = -owner.speed * delta
	
	owner.velocity.y += owner.gravity * delta
	
	owner.move_and_slide()


func _on_jump_timer_timeout():
	enter()
	timer.start()
	
