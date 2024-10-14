class_name Player extends CharacterBody3D

@export var SPEED = 7
@export var JUMP_VELOCITY = 7

@onready var model = $Rig
@onready var anim_tree = $AnimationTree
@onready var anim_state = $AnimationTree.get("parameters/playback")
@onready var gimbal = $Gimbal

@onready var main_cam = %MainCamera

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var jumping = false
var was_on_floor = true


func _physics_process(delta):
	var input_dir := Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var direction := Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, gimbal.rotation.y).normalized()
	
	if direction:
		#direction = direction.rotated(Vector3.UP, main_cam.rotation.y).normalized()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		# rotate model to face camera direction
		model.rotation.y = lerp_angle(model.rotation.y, gimbal.rotation.y, 5 * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	# animate the idle-walk-run animation transitions
	var vl = velocity * model.transform.basis
	anim_tree.set("parameters/IWR/blend_position", Vector2(vl.x, -vl.z) / SPEED)
	
	handle_falling(delta)
	move_and_slide()


func handle_falling(delta):
	if is_not_on_floor():
		# add gravity
		velocity.y -= gravity * delta
		
	# jump 
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		jumping = true
		anim_tree.set("parameters/conditions/jumping", true)
		anim_tree.set("parameters/conditions/grounded", false)
		
	# land on floor (add fall damage here)
	if is_on_floor() and not was_on_floor:
		jumping = false
		anim_tree.set("parameters/conditions/jumping", false)
		anim_tree.set("parameters/conditions/grounded", true)
		
	# play falling animation (fall damage multiplier goes here)
	if is_falling():
		anim_state.travel("Jump_Idle")
		anim_tree.set("parameters/conditions/grounded", false)
		
	anim_tree.set("parameters/conditions/jumping", jumping)
		
	# store if player was on floor last frame
	was_on_floor = is_on_floor()


func is_not_on_floor():
	return is_on_floor() == false


func is_falling():
	return is_not_on_floor() and not jumping
