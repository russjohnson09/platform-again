extends Node2D


#@export var parent: PackedScene;

@export var parent: Node2D

@export var movement_time = 0.1


#https://www.reddit.com/r/godot/comments/tazz2w/how_to_put_a_scene_into_a_variable/

#@onready var sprite2d = get_node("Sprite2D")



#https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
# TODO packaged scene
#var tail_scene = preload("res://characters/snake/SnakeHead.tscn")
var tail_scene = preload("res://characters/snake/SnakeBody.tscn")


var tail

var movement_float = 0.0

var move_unit: int = 4

var input_prefix = "p1_"


var move_vector := Vector2i(0,1) # Vector2.ZERO

var grow_tail := false
var just_grew := false
var grow_tail_at := Vector2i(0,0)

var position_integer := Vector2i(0,0)
var last_position_integer := Vector2i(0,0)

# TODO 
var body_parts = []

func _ready() -> void:
	
	pass
	

#func get_left_right() -> float:
	#var left = (input_prefix + "left")
	#var right =  (input_prefix + "right")
	#return Input.get_axis(left,right)
	#
#func get_up_down() -> float:
	#var up = (input_prefix + "up")
	#var down =  (input_prefix + "down")
	#return Input.get_axis(up,down)
#
#func get_direction() -> Vector2:
	#var left_right

func update_move_vector():
	
	var input_vector = Input.get_vector(input_prefix + "left"
		, input_prefix + "right",
		input_prefix + "up",
		input_prefix + "down")
	
	# cannot reverse directions.
	# (If you are moving left you must go up or down then go right)
	if abs(input_vector.x) > 0.8 and abs(move_vector.x) < 0.5:
		move_vector.y = 0
		if input_vector.x < 0:
			move_vector.x = -1
		else:
			move_vector.x = 1
	elif abs(input_vector.y) > 0.8  and abs(move_vector.y) < 0.5:
		move_vector.x = 0
		#move_vector.y = input_vector.y
		if input_vector.y < 0:
			move_vector.y = -1
		else:
			move_vector.y = 1


func handle_grow():
	
	if not grow_tail:
		return
	
	
	grow_tail = false
	just_grew = true
	#sprite2d = Sprite2D.new() # Create a new Sprite2D.
	#add_child(sprite2d) # Add it as a child of this node.
	var instance = tail_scene.instantiate()
	instance.position = grow_tail_at
#	https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
	
	

	#var old_tail = tail
		#tail.add(instance)
	
	parent.add_child(instance)
	tail = instance
	
	body_parts.append(tail)
	
	#if old_tail:
		#tail.tail = old_tail
		#old_tail.test = "123"
	
	#body_parts.append(instance)
	
	

func _physics_process(delta: float) -> void:
	
	movement_float += delta
	
	if movement_float < movement_time:
		return
	
	movement_float -= movement_time
	
	last_position_integer = position_integer

	update_move_vector()


	
	move_unit * move_vector
	
	position_integer += move_unit * move_vector
	position = position_integer
	
	#if tail:
		#tail.move_to(last_position_integer)
		#tail.position = last_position_integer
	for body in body_parts:
		var last_tail_position = body.position

		body.position = last_position_integer
		last_position_integer = last_tail_position

		#if just_grew:
			#just_grew = false
		#else:
			#body.position = last_position_integer
	
	handle_grow()


func _on_timer_timeout() -> void:
	grow_tail = true
	grow_tail_at = position_integer
	
	for body in body_parts:
		grow_tail_at = body.position
		print(grow_tail_at)
