extends Area2D

@onready var player = get_parent().get_node("player")
@onready var direction = (player.position - global_position).normalized()
@export var speed = 500


func _physics_process(delta):
	global_position += direction * speed * delta

