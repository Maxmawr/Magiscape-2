extends State

@onready var player = owner.get_parent().get_node("player")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var marker = owner.get_node("Marker2D")

func enter(msg := {}) -> void:
	if msg.has("melee"):
		animationplayer.play("melee")
	else:
		animationplayer.play("attack")
		var p = owner.projectile.instantiate()
		p.transform = marker.global_transform
		p.scorpion = owner
		owner.owner.add_child(p)


func hit():
	player.take_damage(5, owner.position)


func _on_animation_player_animation_finished(anim_name):
	if state_machine.state == self:
		state_machine.transition_to("Hostile")
