extends Area2D

@onready var player_pos
@onready var direction = (player_pos - global_position).normalized()
@export var speed = 500
var gazer

# Called when the node enters the scene tree for the first time.
func _ready():
	$shoot.play()
	print(direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	global_position += direction * speed * delta


func _on_body_entered(body):
	if body.name == "player":
		body.take_damage(8, gazer.global_position)
	
	if body.is_in_group("enemies"):
		body.handle_hit(8)
