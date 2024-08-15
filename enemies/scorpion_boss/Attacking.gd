extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var marker = owner.get_node("Marker2D")

func enter(_msg := {}) -> void:
	animationplayer.play("attack")
	
	var p = owner.projectile.instantiate()
	p.transform = marker.global_transform
	p.scorpion = owner
	owner.owner.add_child(p)


func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name):
	if state_machine.state == self:
		state_machine.transition_to("Hostile")
