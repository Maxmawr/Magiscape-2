extends Area2D

@onready var player_pos
@onready var direction = (player_pos - global_position).normalized()
@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	global_position += direction * speed * delta


func _on_body_entered(body):
	if body.name == "player":
		body.take_damage(8)
