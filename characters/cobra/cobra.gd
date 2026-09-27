extends CharacterBody2D

signal player_out_of_bounds

@export var JUMP_SPEED := 120 * 2
@export var WALK_FORCE := 800
@export var WALK_MAX_SPEED := 50
@export var STOP_FORCE := 1300

const PUSH_FORCE = 80.0

@onready var gravity := float(ProjectSettings.get_setting("physics/2d/default_gravity"))

@export var controlled_by_player = true

@export var player1 = true
@export var player2 = false

@export var speed = 100.0


@onready var animation: AnimatedSprite2D = $Snake1
@onready var ceiling_raycast: RayCast2D = $RayCast2D

var input_prefix = "p1_"


func set_input_prefix():
	if player1:
		input_prefix = 'p1_'
	else:
		input_prefix = 'p2_'

func _ready() -> void:
	set_input_prefix()
	
	

func get_walk_dir() -> float:
	var left = (input_prefix + "left")
	var right =  (input_prefix + "right")
	return Input.get_axis(left,right)

func update_image(walk_dir: float):
	
	if abs(walk_dir) < 0.1:
		animation.pause()
		#animation.play("kai_idle_")
	else:
		animation.play("default")
	
	# TODO crawling on ceiling 
	# raytrace to see if close enough to ceiling
	if animation.flip_h == false and walk_dir < 0:
		animation.flip_h = true
	elif walk_dir > 0.1:
		animation.flip_h = false


func do_flip():
	animation.flip_v = not animation.flip_v
	up_direction = up_direction * -1
	ceiling_raycast.rotation_degrees += 180
	
func reset():
	if animation.flip_v:
		do_flip()
	velocity = Vector2(0,0)
	

func _physics_process(delta: float) -> void:
	var walk_dir := get_walk_dir()
	
	update_image(walk_dir)
	var walk := (WALK_FORCE * walk_dir)
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	var down_direction = up_direction * -1.0
	velocity += (gravity * delta * down_direction)

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	move_and_slide()
	
	
	if is_on_floor() and Input.is_action_just_pressed(input_prefix + &"jump"):
		velocity = (JUMP_SPEED * up_direction)

	if not is_on_floor():
		if ceiling_raycast.is_colliding():
			var collider = $RayCast2D.get_collider()
			# TODO check type of collision of change collision masking
			do_flip()
		pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	
	player_out_of_bounds.emit()
	pass # Replace with function body.
