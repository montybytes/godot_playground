extends Node3D

@onready var pause_menu:Control = $CanvasLayer/PauseMenuController


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		pause_menu.show()
		
		get_tree().paused = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
