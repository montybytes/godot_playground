class_name VehicleEngine extends Node


var vehicle: VehicleBody3D


func _ready() -> void:
	vehicle = get_parent()


func _physics_process(delta: float) -> void:
	var torque = vehicle.hp * 10 * Input.get_axis("brake", "accelerate")
	var speed = vehicle.linear_velocity.length()
	var downforce = min(vehicle.downforce_factor * pow(speed, 2), vehicle.max_downforce)
	var force = Vector3(0, downforce * -1, 0)
	var friction_modifier = 1 / (1 + downforce * 0.001)

	vehicle.engine_force = torque
	vehicle.apply_central_force(force)
	
	#for wheel:VehicleWheel3D in vehicle.wheels:
		#wheel.wheel_friction_slip = vehicle.base_friction_slip * friction_modifier

# Suggested improvements:
# - Support more advanced input like throttle control or gear shifts if needed for specific vehicle types.
