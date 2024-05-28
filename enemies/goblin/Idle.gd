extends State

@onready var timer = owner.get_node("idle_timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_idle_timer_timeout():
	if owner.scale.x == 1:
		owner.scale.x = -1
	elif owner.scale.x == -1:
		owner.scale.x = 1
