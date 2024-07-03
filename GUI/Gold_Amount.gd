extends Label

func _process(_delta):
	text = "Current Gold: " + str(Permavariables.gold_amount + Permavariables.temp_gold_amount)
