extends Area2D

@export var launch_height = -500

func _ready():
	$Sprite2D.frame = randi_range(0,1)

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = launch_height
