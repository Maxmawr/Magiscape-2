extends State

@onready var timer = owner.get_node("idle_timer")
@onready var sprite = owner.get_node("Sprite2D")
@onready var animationplayer = owner.get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	animationplayer.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(owner.direction_facing)


func _on_idle_timer_timeout():
	if state_machine.state == self:
		if owner.direction_facing == "right":
			sprite.flip_h = true
			owner.direction_facing = "left"
		elif owner.direction_facing == "left":
			sprite.flip_h = false
			owner.direction_facing = "right"


func _on_viewcone_left_body_entered(body):
	if body.name == "player" and state_machine.state == self:
		state_machine.transition_to("Hostile")


func _on_viewcone_right_body_entered(body):
	if body.name == "player" and state_machine.state == self:
		state_machine.transition_to("Hostile")
