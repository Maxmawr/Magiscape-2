extends Area2D

@export_multiline var message = "text_here"

# Called when the node enters the scene tree for the first time.
func _ready():
	$text.text = message


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		$text.visible = true


func _on_body_exited(body):
	if body.name == "player":
		$text.visible = false
