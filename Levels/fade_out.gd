extends ColorRect

signal change_level

# Called when the node enters the scene tree for the first time.
#func _ready():
	#visible = true

func start():
	$AnimationPlayer.play("fade_out")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		emit_signal("change_level")
