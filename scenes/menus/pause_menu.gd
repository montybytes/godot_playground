extends Control


@onready var main_menu = "res://scenes/menus/main_menu.tscn"
@onready var pause_menu:Control = $PauseMenu
@onready var settings_menu:Control = $SettingsMenu


func _on_resume_pressed() -> void:
	get_tree().paused = false
	pause_menu.hide()

	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_settings_pressed() -> void:
	settings_menu.show()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(main_menu)


func _on_quit_pressed() -> void:
	get_tree().quit()
