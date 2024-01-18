extends State
@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var area = get_parent().get_parent()

func enter(_msg := {}) -> void:
	animationplayer.play("bound")

func update(_delta: float) -> void:
	if area.dead == true:
		state_machine.transition_to("Dead")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "bound":
		state_machine.transition_to("Flying")
