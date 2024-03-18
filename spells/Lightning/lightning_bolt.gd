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
		$explosion.process_material.direction = Vector3(1, 0, 0)
	elif direction == "left":
		$Sprite2D.set_flip_h(true)
		$explosion.process_material.direction = Vector3(-1, 0, 0)


func _on_area_entered(area):
	if area.is_in_group("enemies"):
		if area.has_method("handle_hit") and area.dead == false:
			first_hit = area
			split()
			area.handle_hit(3)
			$Sprite2D.visible = false
			call_deferred("disable_collision")
			$explosion.emitting = true
			$hitsound.play()
			$delete_timer.start()

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		if body.has_method("handle_hit") and body.dead == false:
			first_hit = body
			split()
			body.handle_hit(3)
			$Sprite2D.visible = false
			call_deferred("disable_collision")
			$explosion.emitting = true
			$hitsound.play()
			$delete_timer.start()
	if body.is_in_group("wall"):
			$Sprite2D.visible = false
			call_deferred("disable_collision")
			$explosion.emitting = true
			$hitsound.play()
			$delete_timer.start()

func split():
	for enemy in $detection_area.get_overlapping_bodies():
		if not enemy.is_in_group("enemies") or enemy == first_hit or enemy.dead == true:
			pass
		else:
			var l = small_lightning.instantiate()
			l.transform = self.global_transform
			l.target = enemy
			call_deferred("spawn", l)
	for enemy in $detection_area.get_overlapping_areas():
		if enemy.is_in_group("enemies") == false or enemy == first_hit or enemy.dead == true:
			pass
		else:
			var l = small_lightning.instantiate()
			l.transform = self.global_transform
			l.target = enemy
			call_deferred("spawn", l)


func disable_collision():
	$CollisionShape2D.disabled = true


func _on_delete_timer_timeout():
	queue_free()

func spawn(l):
	root.add_child(l)
