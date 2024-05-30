extends State

@onready var player = owner.get_parent().get_node("player")
@onready var sprite = owner.get_node("Sprite2D")
func enter(_msg := {}) -> void:
	pass


func update(_delta: float) -> void:
	print("player",player.global_position.x)
	print("owner",owner.global_position.x)
	if player.global_position.x > owner.global_position.x:
		sprite.flip_h = false
		owner.direction_facing = "left"
		#owner.scale.x = 1
	else:
		sprite.flip_h = true
		owner.direction_facing = "right"
		#owner.scale.x = -1
	

func physics_update(delta: float) -> void:
	if player.global_position > owner.global_position:
		owner.velocity.x = owner.hostile_speed * delta
	else:
		owner.velocity.x = -owner.hostile_speed * delta
	owner.move_and_slide()
