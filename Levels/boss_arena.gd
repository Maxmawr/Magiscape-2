extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("player").get_node("Camera2D").zoom = Vector2(2, 2)
	get_node("player").get_node("healthbar").position.x = -270
	get_node("player").get_node("healthbar").position.y = -175
	get_node("player").get_node("manabar").position.x = -270
	get_node("player").get_node("manabar").position.y = -160
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
