extends Area2D


signal show_text

var cantake = false

@onready var message = """Health Potion: +25 Max Health
Press F to collect"""

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("bob")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if cantake == true:
			Permavariables.maxhealth += 5
			$Sprite2D.visible = false
			$CollisionShape2D.disabled = true
			$GPUParticles2D.emitting = true
			cantake = false


func _on_body_entered(body):
	if body.name == "player":
		emit_signal("show_text", message)
		cantake = true


func _on_body_exited(body):
	if body.name == "player":
		cantake = false
