extends Area2D

var speed = 300

@onready var direction = Permavariables.direction_facing
@onready var root = get_parent()
@onready var first_hit

@export var small_lightning : PackedScene


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


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		if area.has_method("handle_hit") and area.dead == false:
			first_hit = area
			split()
			area.handle_hit(3)
			$hitsound.play()
			queue_free()

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		if body.has_method("handle_hit") and body.dead == false:
			first_hit = body
			split()
			body.handle_hit(3)
			$hitsound.play()
			if $hitsound.playing == true:
				print("RAGHHH")
			queue_free()

func split():
	for enemy in $detection_area.get_overlapping_bodies():
		if not enemy.is_in_group("enemies") or enemy == first_hit:
			pass
		else:
			var l = small_lightning.instantiate()
			l.transform = self.global_transform
			l.target = enemy
			root.add_child(l)
	for enemy in $detection_area.get_overlapping_areas():
		if enemy.is_in_group("enemies") == false or enemy == first_hit:
			pass
		else:
			var l = small_lightning.instantiate()
			l.transform = self.global_transform
			l.target = enemy
			root.add_child(l)



