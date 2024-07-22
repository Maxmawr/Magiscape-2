extends Area2D

@onready var bottom_text = get_tree().root.get_node("Bottom_Text")
@onready var message = """Health Potion: +25 Max Health
Press E to purchase"""

# Called when the node enters the scene tree for the first time.
func _ready():
	print(bottom_text)
	#bottom_text.text = message


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
