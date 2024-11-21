extends Camera3D

@export var lerp_speed = 3.0
@export var target: Node3D
@export var offset = Vector3.ZERO

func _input(event: InputEvent):
	if Input.is_action_pressed("exit"):
		get_tree().quit()


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta):
	if !target: return

	var target_transform = target.global_transform.translated_local(offset)
	global_transform = global_transform.interpolate_with(target_transform, lerp_speed * delta)

	look_at(target.global_transform.origin, target.transform.basis.y)
