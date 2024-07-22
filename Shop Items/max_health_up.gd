extends Area2D

signal show_text

@onready var message = """Health Potion: +25 Max Health
Press E to purchase"""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		emit_signal("show_text", message)
