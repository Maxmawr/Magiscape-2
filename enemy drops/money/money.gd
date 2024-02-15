extends RigidBody2D

# To change sprite depending on money amount
var single_coin = range(1,6)
var coin_stack = range(6,11)
var nugget = range(11, 21)
var bar = 21  # And anything above

func _ready():
	set_sprite(6)
	# Applies a random force to make the coin move a little different every time
	var vector = Vector2(randi_range(-400, 400), randi_range(-1000, -650))
	apply_central_impulse(vector)


func _process(delta):
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
		$sprite.frame = 15


func _on_body_entered(body):
	if body.name == "player":
		queue_free()
