extends CharacterBody3D


@export var max_speed = 50.0
@export var acceleration = 0.6
@export var pitch_speed = 1.5
@export var roll_speed = 1.9
@export var yaw_speed = 1.25

@export var input_response = 8.0

var forward_speed = 0
var pitch_input = 0.0
var roll_input = 0.0
var yaw_input = 0.0


func get_input(delta):
	if Input.is_action_pressed("throttle_up"):
		forward_speed = lerpf(forward_speed, max_speed, acceleration * delta)
	if Input.is_action_pressed("throttle_down"):
		forward_speed = lerpf(forward_speed, 0, acceleration * delta)
	
	pitch_input = lerp(pitch_input, Input.get_axis("pitch_down", "pitch_up"), input_response * delta)
	roll_input = lerp(roll_input, Input.get_axis("roll_left", "roll_right"), input_response * delta)
		
	if Input.is_action_pressed("yaw_left") or Input.is_action_pressed("yaw_right"):
		yaw_input = lerp(yaw_input, Input.get_axis("yaw_right", "yaw_left"), input_response * delta)
	else:
		yaw_input = 0.3 * roll_input
	
	transform.basis = transform.basis.rotated(transform.basis.z, roll_input * roll_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.x, pitch_input * pitch_speed * delta)
	transform.basis = transform.basis.rotated(transform.basis.y, yaw_input * yaw_speed * delta)
	transform.basis = transform.basis.orthonormalized()


func _physics_process(delta):
	get_input(delta)
	velocity = transform.basis.z * forward_speed
	move_and_collide(velocity * delta)
