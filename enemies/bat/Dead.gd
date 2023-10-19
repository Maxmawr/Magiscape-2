extends State

var gravity = 10

@onready var animationplayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var area = get_parent().get_parent()

func enter(_msg := {}) -> void:
	animationplayer.play("dead")



func _process(delta):
	area.position.y += + gravity * delta
