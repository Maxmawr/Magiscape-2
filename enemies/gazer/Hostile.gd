extends State

@onready var laser_point = owner.get_node("laser_point")
@onready var player = owner.get_parent().get_node("player")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var player_position = player.position

var line_length = 1
var line_color = Color(1, 0, 0) # Red color for the line
var canshoot
var laser_moving = true

func enter(_msg := {}) -> void:
	canshoot = true
	laser_moving = true
	animationplayer.play("shooting")
	line_color = Color(1, 0, 0)
	line_length = 1

func update(_delta: float) -> void:
	if canshoot == true and laser_moving == true:
		owner.queue_redraw()

func physics_update(_delta: float) -> void:
	pass


func _on_gazer_draw():
	if canshoot == true:
		player_position = player.position
		laser_point = owner.get_global_position()
		owner.draw_line(Vector2.ZERO, player_position - laser_point, line_color, line_length)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "shooting":
		line_color = Color(1, 0, 0)
		if state_machine.state == self:
			canshoot = false
			state_machine.transition_to("Idle")

func shoot():
	#player.take_damage(5)
	line_color = Color(00000000)
	owner.queue_redraw()
	var l = owner.laser.instantiate()
	l.player_pos = player_position
	l.transform = owner.global_transform
	owner.owner.add_child(l)


func stop_laser():
	laser_moving = false
	line_color = Color("ffffff")
	player_position = player.global_position
	line_length = 2
