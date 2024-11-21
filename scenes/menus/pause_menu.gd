extends Control


@onready var main_menu = "res://scenes/menus/main_menu.tscn"
@onready var pause_menu:Control = $"."
@onready var settings_menu:Control = $SettingsMenu


func _on_resume_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pause_menu.hide()
	
	get_tree().paused = false


func _on_settings_pressed() -> void:
	settings_menu.show()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(main_menu)


func _on_quit_pressed() -> void:
	get_tree().quit()
