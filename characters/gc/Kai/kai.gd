extends CharacterBody2D


signal player_out_of_bounds
#const WALK_FORCE = 600
#const WALK_MAX_SPEED = 400
#const STOP_FORCE = 1300
@export var JUMP_SPEED := 200 * 2
@export var WALK_FORCE := 800
@export var WALK_MAX_SPEED := 400
@export var STOP_FORCE := 1300

const PUSH_FORCE = 80.0

@onready var gravity := float(ProjectSettings.get_setting("physics/2d/default_gravity"))

@export var controlled_by_player = true

@export var player1 = true
@export var player2 = false

@export var speed = 100.0


@onready var animation = $KaiAnimation

var input_prefix = "p1_"


func set_input_prefix():
	if player1:
		input_prefix = 'p1_'
	else:
		input_prefix = 'p2_'

func _ready() -> void:
	set_input_prefix()
	
	animation.play("kai_sprint")
	
	

func get_walk_dir() -> float:
	var left = (input_prefix + "left")
	var right =  (input_prefix + "right")
	return Input.get_axis(left,right)

func _physics_process(delta: float) -> void:
#	https://www.reddit.com/r/godot/comments/11m8rtk/what_does_the_colon_sign_mean_in_the_variable/
# Use : for explicity typing. Raise type errors early and often
	var walk_dir := get_walk_dir()
	# Horizontal movement code. First, get the player's input.
	#var walk := WALK_FORCE * walk_dir
	
	#var walk = WALK_FORCE * walk_dir
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
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	move_and_slide()
	
	if is_on_floor():
	#	https://github.com/godotrecipes/character_vs_rigid/blob/master/player.gd#L4
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				c.get_collider().apply_central_impulse(-c.get_normal() * PUSH_FORCE)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed(input_prefix + &"jump"):
		velocity.y = -JUMP_SPEED
	
	if abs(velocity.x) < 0.1:
		animation.play("kai_idle_")
	else:
		animation.play("kai_sprint")
		
	if animation.flip_h == false and velocity.x < 0:
		animation.flip_h = true
	elif velocity.x > 0.1:
		animation.flip_h = false
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	
	player_out_of_bounds.emit()
	pass # Replace with function body.
