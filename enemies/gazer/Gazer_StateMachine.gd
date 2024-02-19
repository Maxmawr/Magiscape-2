class_name Gazer_StateMachine
extends Node


signal transitioned(state_name)

@export var initial_state = NodePath()


@onready var state: State = get_node(initial_state)


func _ready() -> void:
	await owner.ready

	for child in get_children():
		child.state_machine = self
	state.enter()


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		return

	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", state.name)


func _on_sight_area_body_entered(body):
	if body.name == "player" and state == get_node("Idle"):
		transition_to("Hostile")


func _on_gazer_change_to_dead():
	transition_to("Dead")


func _on_gazer_bind():
	if state == get_node("Bind"):
		get_node("Bind").restart()
	else:
		transition_to("Bind")
