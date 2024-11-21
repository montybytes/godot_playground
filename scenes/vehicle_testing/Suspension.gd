class_name VehicleSuspension extends Node


@export var natural_frequency: float = 10.0
@export var damping_ratio: float = 0.8
@export var force_shift: float = 0.03
@export var set_suspension_distance: bool = true

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var vehicle: VehicleBody3D


func _ready() -> void:
	vehicle = get_parent()


func _physics_process(delta: float) -> void:
	pass
	#for wheel in wheels:
		#var spring = wheel.suspension_stiffness
		#var sprung_mass = vehicle.mass / wheels.size()
		
		#wheel.suspension_stiffness = pow(sqrt(sprung_mass) * natural_frequency, 2)
		#wheel.damping_compression = 2 * damping_ratio * sqrt(wheel.suspension_stiffness * sprung_mass)
		#wheel.damping_relaxation = wheel.damping_compression * 1.1
		
		#var distance = (vehicle.transform.origin.y - wheel.transform.origin.y) + wheel.wheel_radius

		#if wheel.wheel_rest_length > 0 and set_suspension_distance:
			#var target_postion = wheel.suspension_travel - wheel.wheel_rest_length
			#wheel.suspension_travel = sprung_mass * gravity / (target_postion * wheel.suspension_stiffness)
