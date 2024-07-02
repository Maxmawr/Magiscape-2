extends State

@onready var player = owner.get_parent().get_node("player")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var sprite = owner.get_node("Sprite2D")
@onready var throw_cooldown = owner.get_node("throw_cooldown")

func enter(_msg := {}) -> void:
	animationplayer.play("attack")


func update(_delta: float) -> void:
	if player.global_position.x > owner.global_position.x:
		sprite.flip_h = false
		owner.direction_facing = "right"
	else:
		sprite.flip_h = true
		owner.direction_facing = "left"

func physics_update(_delta: float) -> void:
	pass

func attack_arc():
	var a = owner.axe.instantiate()
	a.transform = owner.global_transform
	owner.owner.add_child(a)
	
	a.launch(player.global_position)
	throw_cooldown.start()
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attack":
		state_machine.transition_to("Hostile")
