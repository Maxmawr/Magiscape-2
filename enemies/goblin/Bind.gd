extends State

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")

func enter(_msg := {}) -> void:
	animationplayer.play("bound")

func update(_delta: float) -> void:
	pass

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "bound":
		animationplayer.play("RESET")
		state_machine.transition_to("Hostile")

func restart():
	animationplayer.stop()
	animationplayer.play("bound")
