class_name VehicleSteering extends Node


var vehicle: VehicleBody3D


func _ready() -> void:
	vehicle = get_parent()


func _physics_process(delta: float) -> void:
	var angle = vehicle.max_steer_angle * Input.get_axis("right", "left")
	
	vehicle.steering = move_toward(vehicle.steering, deg_to_rad(angle), delta * vehicle.steer_speed)
	
# Suggested improvements:
# - Support controller input for smooth steering based on joystick position
