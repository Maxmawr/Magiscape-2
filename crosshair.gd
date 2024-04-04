extends Area2D

var line_color = Color("9d9d9ddc")
var line_width = 0.5
@onready var arm = get_parent().get_node("arm")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = get_global_mouse_position()
	queue_redraw()

func _on_draw():
	draw_line(Vector2.ZERO, arm.global_position - global_position, line_color, line_width)
