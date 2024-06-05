extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")


func enter(_msg := {}) -> void:
	animationplayer.play("attack")


func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass


func _on_attack_area_body_exited(body):
	if state_machine.state == self:
		state_machine.transition_to("Hostile")
