extends Sprite2D


var line_color = Color("9d9d9ddc")
var line_width = 0.5

@onready var crosshair = get_parent().get_node("crosshair")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	queue_redraw()



func _on_draw():
	draw_line(Vector2.ZERO, crosshair.position - position, line_color, line_width)
