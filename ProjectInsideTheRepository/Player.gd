extends KinematicBody

export var speed = 14
export var fall_acceleration = 75

var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	direction.x=Input.get_action_strength("move_right")-Input.get_action_strength("move_left")
	direction.z=Input.get_action_strength("move_back")-Input.get_action_strength("move_forward")
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
	
	velocity.x = direction.x*speed
	velocity.z = direction.z*speed
	velocity.y -= fall_acceleration * delta
	
	velocity = move_and_slide(velocity, Vector3.UP)
