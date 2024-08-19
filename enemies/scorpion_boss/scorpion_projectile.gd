extends Area2D

var scorpion
var moving = false

@onready var player = get_parent().get_node("player")
@onready var player_pos = player.global_position
@onready var direction = (player_pos - global_position).normalized()
@export var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.scale = Vector2(0,0)
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D, "scale", Vector2(1, 1), 1.5).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_callback(shoot)


func _physics_process(delta):
	if moving == true:
		global_position += direction * speed * delta

func shoot():
	moving = true

func _on_body_entered(body):
	if body.name == "player":
		body.take_damage(8, scorpion.global_position)
	
	if body.is_in_group("enemies"):
		body.handle_hit(8)
