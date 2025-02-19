class_name MouseCamera extends Node3D

@export var target: Node3D
@export var offset = Vector3.ZERO
@export var mouse_sensitivity: float = 0.05


func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 30)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0, 360)
		
	if Input.is_action_pressed("exit"):
		get_tree().quit()


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	pass
