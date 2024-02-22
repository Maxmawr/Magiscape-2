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
func _process(_delta):
	if direction == "right":
		$Sprite2D.set_flip_h(false)
	elif direction == "left":
		$Sprite2D.set_flip_h(true)


func _on_body_entered(body):
	if body.is_in_group("enemies"):
		if body.has_method("handle_hit") and body.dead == false:
			body.handle_hit(5)
			speed = 0
			$Sprite2D.visible = false
			call_deferred("disable_collision")
			$explosion.emitting = true
			$explosion_sound.play()
			$delete_timer.start()
	if body.is_in_group("wall"):
		speed = 0
		$Sprite2D.visible = false
		call_deferred("disable_collision")
		$explosion.emitting = true
		$explosion_sound.play()
		$delete_timer.start()


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		if area.has_method("handle_hit") and area.dead == false:
			area.handle_hit(5)
			speed = 0
			$Sprite2D.visible = false
			call_deferred("disable_collision")
			$explosion.emitting = true
			$explosion_sound.play()
			$delete_timer.start()


func _on_delete_timer_timeout():
	queue_free()

func disable_collision():
	$CollisionShape2D.disabled = true
