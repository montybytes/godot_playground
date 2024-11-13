extends Control


@onready var main_menu = "res://scenes/menus/main_menu.tscn"
@onready var pause_menu = "res://scenes/menus/pause_menu.tscn"


func _on_play_music_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_play_sfx_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_master_volume_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_sfx_volume_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_options_back_pressed() -> void:
	self.hide()
