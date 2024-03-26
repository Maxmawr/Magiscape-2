extends Area2D

@export var inside : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		body.change_state("Get_Item")
		$Sprite2D.frame = 1
		var i = inside.instantiate()
		i.position = $spawn_point.position
		add_child(i)
		Permavariables.has_lightning = true
		call_deferred("disable_collision")


func disable_collision():
	$CollisionShape2D.disabled = true
