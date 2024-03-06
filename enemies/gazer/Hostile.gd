extends State

@onready var laser_point = owner.get_node("laser_point")
@onready var player = owner.get_parent().get_node("player")
@onready var animationplayer = owner.get_node("AnimationPlayer")
@onready var player_position = player.position
@onready var sight_area = owner.get_node("sight_area")

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
	
	#var dir = (player.global_position - owner.global_position).normalized()
	if player.global_position > owner.global_position:
		owner.get_node("Sprite2D").flip_h = false
	else:
		owner.get_node("Sprite2D").flip_h = true

func physics_update(_delta: float) -> void:
	pass


func _on_gazer_draw():
	if canshoot == true:
		player_position = player.position
		laser_point = owner.get_global_position()
		owner.draw_line(Vector2.ZERO, player_position - laser_point, line_color, line_length)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "shooting":
		if state_machine.state == self:
			for body in sight_area.get_overlapping_bodies():
				if body.is_in_group("player"):
					enter()
					return
			canshoot = false
			state_machine.transition_to("Idle")

func shoot():
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


func _on_gazer_change_to_dead():
	canshoot = false
	line_color = Color(00000000)
	owner.queue_redraw()


func _on_gazer_bind():
	canshoot = false
	line_color = Color(00000000)
	owner.queue_redraw()
