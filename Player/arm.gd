extends Sprite2D

#@onready var direction = (target.global_position - global_position).normalized()

var line_color = Color("9d9d9ddc")
var line_width = 0.5

@onready var crosshair = get_parent().get_node("crosshair")
@onready var start_point = get_parent().get_node("spell_spawn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	queue_redraw()
	Permavariables.crosshair_position = crosshair.global_position
	
	if crosshair.position.x - position.x >= 0:
		Permavariables.direction_facing = "right"
	else:
		Permavariables.direction_facing = "left"



func _on_draw():
	draw_line(Vector2.ZERO, crosshair.global_position - global_position, line_color, line_width)
