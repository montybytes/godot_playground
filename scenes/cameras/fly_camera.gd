class_name FlyCamera extends Node3D

@export var mouse_sensitivity: float = 0.05
@export var fly_speed: int = 50

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		# rotate up and down
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)
		# rotate left and right
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0, 360)


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	# get inputs from keyboard
	var x_input = Input.get_axis("strafe_left", "strafe_right")
	var y_input = Input.get_axis("drop", "rise")
	var z_input = Input.get_axis("forward", "backward")
	
	var direction = Vector3(x_input, y_input, z_input).rotated(Vector3.UP, self.rotation.y).normalized()
	
	# move the camera
	global_translate(direction * fly_speed * delta)
	pass
