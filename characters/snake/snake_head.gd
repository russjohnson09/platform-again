extends Node2D


signal death

@onready var parent = get_parent()

@export var movement_time = 0.1
#@export var movement_time = 0.5


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

var next_move_vector := Vector2i(0,1)

# by default the first growth is on the first move
@export var grow_tail := true

var just_grew := false
var grow_tail_at := Vector2i(0,0)

var position_integer := Vector2i(0,0)
var last_position_integer := Vector2i(0,0)

# TODO 
var body_parts = []

func _ready() -> void:
	
	pass
	

func handle_grow():
	
	if not grow_tail:
		return
	
	grow_tail = false
	just_grew = true
	#sprite2d = Sprite2D.new() # Create a new Sprite2D.
	#add_child(sprite2d) # Add it as a child of this node.
	var instance = tail_scene.instantiate()
	
	#print("handle_grow", grow_tail_at)
	instance.position = grow_tail_at
#	https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
	
	parent.add_child(instance)
	tail = instance
	
	body_parts.append(tail)


func do_grow() -> void:
	grow_tail = true
	grow_tail_at = position_integer
	
func handle_grow_input() -> void:
	
	#if Input.is_action_just_pressed(input_prefix + "grow"):
	if Input.is_action_pressed(input_prefix + "grow"):
		#grow_tail = true
		do_grow()
	
	pass


func get_next_move_vector(move_vector: Vector2i):
	
	var input_vector = Input.get_vector(input_prefix + "left"
		, input_prefix + "right",
		input_prefix + "up",
		input_prefix + "down")
	
	var result: Vector2i = next_move_vector
	# cannot reverse directions.
	# (If you are moving left you must go up or down then go right)
	if abs(input_vector.x) > 0.8 and abs(move_vector.x) < 0.5:
		result.y = 0
		if input_vector.x < 0:
			result.x = -1
		else:
			result.x = 1
	elif abs(input_vector.y) > 0.8  and abs(move_vector.y) < 0.5:
		result.x = 0
		#move_vector.y = input_vector.y
		if input_vector.y < 0:
			result.y = -1
		else:
			result.y = 1
	return result

func _physics_process(delta: float) -> void:
	
	handle_grow_input()
	movement_float += delta
	
	# buffer up to 
	next_move_vector = get_next_move_vector(move_vector)

	
	if movement_float < movement_time:
		return
	
	move_vector = next_move_vector
	
	movement_float -= movement_time
	
	last_position_integer = position_integer
	
	move_unit * move_vector
	
	position_integer += move_unit * move_vector
	position = position_integer
	
	for body in body_parts:
		var last_tail_position = body.position

		body.position = last_position_integer
		last_position_integer = last_tail_position
	
	handle_grow()


func _exit_tree() -> void:
#Called when the node is about to leave the SceneTree (e.g. upon freeing, scene changing, or after calling remove_child() in a script). If the node has children, its _exit_tree() callback will be called last, after all its children have left the tree.
	
	for body_part: Node2D in body_parts:
		body_part.queue_free()
	pass

func _on_timer_timeout() -> void:
	grow_tail = true
	grow_tail_at = position_integer
	
	for body in body_parts:
		grow_tail_at = body.position
		print(grow_tail_at)


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area.is_in_group('body'):
		print("collided with self")
		emit_signal("death")
	elif area.is_in_group("fruit"):
		do_grow()
	else:
		emit_signal("death")

		
	pass # Replace with function body.
