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
	if body.is_in_group("enemies"):
		speed = 0
		$AnimationPlayer.play("impact")


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		speed = 0
		$AnimationPlayer.play("impact")
