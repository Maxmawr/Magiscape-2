extends State

@onready var animationplayer = owner.get_node("AnimationPlayer")

func enter(_msg := {}) -> void:
	animationplayer.play("blue_get_item")


func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
