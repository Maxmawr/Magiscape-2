extends Area2D

var speed = 300

@onready var direction = Permavariables.direction_facing
@onready var root = get_parent()

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
				var l = small_lightning.instantiate()
				l.transform = self.global_transform
				print(self.global_transform)
				root.add_child(l)
