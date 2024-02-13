extends State

@onready var player = owner.get_parent().get_node("player")
var line_color = Color(1, 0, 0) # Red color for the line
var inside

func enter(_msg := {}) -> void:
	inside = true

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func _on_gazer_draw():
	if inside == true:
		var player_position = player.global_position
		var enemy_position = owner.get_global_position()
		owner.draw_line(Vector2.ZERO, player_position - enemy_position, line_color)
