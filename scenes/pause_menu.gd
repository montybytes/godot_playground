extends Control


func resume() -> void:
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false
	hide()


func pause() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	show()


func isPaused() -> bool:
	return get_tree().paused == true


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	hide()


func _on_exit_pressed() -> void:
	get_tree().quit()


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("exit") and isPaused():
		resume()
	if Input.is_action_pressed("exit") and not isPaused():
		pause()



