extends Control

@onready var settings_menu = $SettingsMenu


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	
func _on_settings_pressed() -> void:
	settings_menu.show()
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_button_1_pressed() -> void:
	
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	pass # Replace with function body.
