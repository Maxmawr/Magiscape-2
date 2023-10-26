extends Area2D

var speed = 300
@onready var direction = Permavariables.direction_facing

func _physics_process(delta):
	if direction == "right":
		position += transform.x * speed * delta
	elif direction == "left":
		position += transform.x * -speed * delta

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("flying")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == "right":
		$Sprite2D.set_flip_h(false)
	elif direction == "left":
		$Sprite2D.set_flip_h(true)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "impact":
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("enemies") or body.is_in_group("wall"):
		speed = 0
		if "dead" in body:
			body.dead = true
#		$AnimationPlayer.play("impact")
		$Sprite2D.visible = false
		$explosion.emitting = true


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		if "dead" in area:
			if area.dead == false:
				area.dead = true
			elif area.dead == true:
				return
#		$AnimationPlayer.play("impact")
		speed = 0
		$Sprite2D.visible = false
		$explosion.emitting = true
