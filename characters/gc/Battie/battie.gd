extends CharacterBody2D

@export var controlled_by_player = true

@export var player1 = true
@export var player2 = false

@export var speed = 100.0

@onready var animation = $BattieAnimation


var input_prefix = "p1_"

func set_input_prefix():
	
	if player1:
		input_prefix = 'p1_'
	else:
		input_prefix = 'p2_'

func get_input_direction_x():
	if Input.is_action_pressed(input_prefix + "right"):
		return 1.0
	elif Input.is_action_pressed(input_prefix + "left"):
		return -1.0
		
	return 0.0
	
func get_input_direction_y():
	if Input.is_action_pressed(input_prefix + "down"):
		return 1.0
	elif Input.is_action_pressed(input_prefix + "up"):
		return -1.0
		
	return 0.0
	
func get_input_direction_vector() -> Vector2:
	
	return Vector2(get_input_direction_x(), get_input_direction_y())

func player_input():
	var input_dir = get_input_direction_vector()
#	https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
	velocity = input_dir * speed
	#move_and_slide()

func _ready() -> void:
	animation.play()
	



func _physics_process(delta: float) -> void:
#	https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html#bouncing-reflecting
	if Input.is_action_pressed("ui_left"):
		pass
		
	
	if controlled_by_player:
		player_input()
	
	
	move_and_slide()

	
