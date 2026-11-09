extends CharacterBody2D



var do_spin_and_turn = false
var pre_spin_angle


func _ready() -> void:
	velocity = Vector2(-5,0)

func _do_spin_and_turn(delta: float):
	$GoldFish.pause()
	var spin_speed = 100.0
	rotation_degrees += 1.0 * delta * spin_speed
	
	move_and_slide()
	print(rotation_degrees)
	if rotation_degrees >= 170.0:
		$GoldFish.flip_h = not $GoldFish.flip_h
		rotation_degrees = 0
		velocity = -1 * velocity
		do_spin_and_turn = false

func _physics_process(delta: float) -> void:
	if do_spin_and_turn:
		return _do_spin_and_turn(delta)
	
	
	var is_colliding = move_and_slide()
	
	if is_colliding and not do_spin_and_turn:
		do_spin_and_turn = true
		pre_spin_angle = rotation_degrees
		print(pre_spin_angle)

	
	
