class_name BaseVehicle extends VehicleBody3D


@export var hp: float = 200
@export var downforce_factor: float = 0.5
@export var max_steer_angle: float = 40
@export var steer_speed: float = 1.5
@export var base_friction_slip = 1.0
@export var max_speed = 400

var max_downforce = 1000
var wheels: Array[VehicleWheel3D] = []


func _ready() -> void:
	for child in get_children():
		if is_instance_of(child, VehicleWheel3D):
			wheels.append(child)
