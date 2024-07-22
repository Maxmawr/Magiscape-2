extends CanvasLayer

@onready var player_area = owner.get_node("player/collision detector")
@onready var bottom_text = $Bottom_Text

func _process(delta):
	for area in player_area.get_overlapping_areas():
		if area.is_in_group("shop_item"):
			bottom_text.visible = true
			bottom_text.text = area.message
		else:
			bottom_text.visible = false
	
	if player_area.has_overlapping_areas() == false:
		bottom_text.visible = false
