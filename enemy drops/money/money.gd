extends RigidBody2D

var value

# To change sprite depending on money amount
var single_coin = range(1,6)
var coin_stack = range(6,11)
var nugget = range(11, 21)
var bar = 21  # And anything above

@export var picked_up = false

func _ready():
	set_sprite(randi_range(1,22))
	# Applies a random force to make the coin move a little different every time
	var vector = Vector2(randi_range(-100, 100), randi_range(-100, -65))
	apply_central_impulse(vector)


func _process(_delta):
	pass

func set_sprite(amount):
	# Takes the amount of money the drop is worth and changes the sprite to reflect it. Also randomises the color
	if single_coin.has(amount):
		$sprite.frame = randi_range(0,4)
	elif coin_stack.has(amount):
		$sprite.frame = randi_range(5,9)
	elif nugget.has(amount):
		$sprite.frame = randi_range(10,14)
	elif amount >= bar:
		$sprite.frame = randi_range(15,19)
	print(amount)
	value = amount



func _on_area_2d_body_entered(body):
	if body.name == "player":
		if picked_up == false:
			Permavariables.gold_amount += value
			print(Permavariables.gold_amount)
			$pickupsound.play()
			$sprite.visible = false
			picked_up = true


func _on_pickupsound_finished():
	queue_free()
