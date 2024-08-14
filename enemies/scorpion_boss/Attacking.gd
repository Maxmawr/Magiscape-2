extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")

func enter(_msg := {}) -> void:
	animationplayer.play("attack")


func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name):
	if state_machine.state == self:
		state_machine.transition_to("Hostile")
