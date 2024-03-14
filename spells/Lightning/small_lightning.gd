extends Area2D

@onready var target
#@onready var player = get_parent().get_node("player")
@onready var direction = (target.global_position - global_position).normalized()
@export var speed = 500



func _physics_process(delta):
	global_position += direction * speed * delta

func _on_area_entered(area):
	if area.is_in_group("enemies"):
		if area.has_method("handle_hit") and area.dead == false:
			area.handle_hit(2)
