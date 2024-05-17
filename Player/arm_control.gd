extends Node2D


@onready var crosshair = owner.get_node("crosshair")
@onready var start_point = owner.get_node("spell_spawn")
@onready var line_position = $arm_sprite/arm_point.global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#if Permavariables.direction_facing == "left":
		#position.x = 1.5
		#position.y = -0.5
	#else:
		#


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	line_position = $arm_sprite/arm_point.global_position

	Permavariables.crosshair_position = crosshair.global_position
	
	if crosshair.position.x - position.x >= 0:
		Permavariables.direction_facing = "right"
	else:
		Permavariables.direction_facing = "left"




