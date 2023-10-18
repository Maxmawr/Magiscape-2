extends State

@export var speed = 10


func enter(_msg := {}) -> void:
	#flying animation here
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	owner.progress_ratio += speed * 1
