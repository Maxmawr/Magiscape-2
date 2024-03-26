extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$visible_timer.start()


func _on_visible_timer_timeout():
	visible = false
