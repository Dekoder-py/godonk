extends CharacterBody2D


const JUMP_VELOCITY = -200.0
const SPEED = 100.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite.flip_h = true if direction > 0 else false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
