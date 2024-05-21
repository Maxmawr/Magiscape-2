extends Area2D

var line_color = Color("9d9d9ddc")
var line_width = 0.5
@onready var arm = get_parent().get_node("Marker2D/arm")
@onready var arm_sprite = get_parent().get_node("Marker2D/arm/arm_sprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = get_global_mouse_position()
	queue_redraw()
	
	if arm_sprite.visible == true:
		line_color = Color("9d9d9ddc")
	else:
		line_color = Color(0)
		

func _on_draw():
	draw_line(Vector2.ZERO, arm.line_position - global_position, line_color, line_width)
