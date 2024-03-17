extends Area2D

@onready var target
#@onready var player = get_parent().get_node("player")
@onready var direction = (target.global_position - global_position).normalized()
@export var speed = 500



func _physics_process(delta):
	global_position += direction * speed * delta

func _on_area_entered(area):
	if area.is_in_group("enemies") and area == target:
		if area.has_method("handle_hit") and area.dead == false:
			area.handle_hit(2)
			$hitsound.play()
			queue_free()


func _on_body_entered(body):
	if body.is_in_group("enemies") and body == target:
		if body.has_method("handle_hit") and body.dead == false:
			body.handle_hit(2)
			$hitsound.play()
			queue_free()
