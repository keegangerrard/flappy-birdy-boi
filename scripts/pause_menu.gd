extends Node

func toggle_pause() -> void:
	var tree = get_tree()
	tree.paused = !tree.paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()
