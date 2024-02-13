extends State

@onready var laser_point = owner.get_node("laser_point")
@onready var player = owner.get_parent().get_node("player")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var player_position = player.position

var line_color = Color(1, 0, 0) # Red color for the line
var inside

func enter(_msg := {}) -> void:
	inside = true
	animationplayer.play("shooting")
	line_color = Color(1, 0, 0)

func update(_delta: float) -> void:
	if inside == true:
		owner.queue_redraw()

func physics_update(_delta: float) -> void:
	pass


func _on_gazer_draw():
	if inside == true:
		player_position = player.position
		laser_point = owner.get_global_position()
		owner.draw_line(Vector2.ZERO, player_position - laser_point, line_color)


func _on_animation_player_animation_finished(anim_name):
	if state_machine.state == self:
		inside = false
		state_machine.transition_to("Idle")

func shoot():
	player.take_damage(5)
	line_color = Color(00000000)
	owner.queue_redraw()
