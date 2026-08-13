extends Node2D


#https://www.reddit.com/r/godot/comments/17o1mkz/instantiate_vs_new/
#https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
#https://docs.godotengine.org/en/stable/classes/class_packedscene.html#class-packedscene

var snake_body_scene = preload("res://characters/snake/SnakeHead.tscn")

var fruit_scene = preload("res://characters/snake/Fruit.tscn")
@export var seed := "test"


#var snake: PackedScene

#var snake: Node2D
var snake
#var fruit
var fruits = [
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
]

@onready var snake_head_spawn_point = $"."

#https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-property-state

var rng = RandomNumberGenerator.new()


func get_fruit_position():
	var top_left_position = $FruitSpawnArea/TopLeft.position
	var bottom_right_position = $FruitSpawnArea/BottomRight.position
	
	var fruit_size = Vector2i(4,4)
	# I'm just using this node as a reference
	#var width: int = (bottom_right_position.x - top_left_position.x) / fruit_size.x
	#var height: int = (bottom_right_position.y - top_left_position.y) / fruit_size.y
	
	var width := 47
	var height := 52
	
	
	var total_positions = (width * height) + (width - 1)
	
	#total_positions = 10
	
	var rand_position = rng.randi_range(0, total_positions)
	
	#print(width)
	#print(total_positions)
	#print(height)
	#rand_position = 46
	#rand_position = 2392
	#rand_position += 45
	#rand_position = 2395
	#rand_position = 46
	
	#var right_bottom_corner =  2444 + 46
	var right_bottom_corner = total_positions
	var left_bottom_corner = 2444
	
	#rand_position = right_bottom_corner
	#rand_position = right_bottom_corner

	# start upper right move right then go down.
	var y_position: int = (rand_position / width) * fruit_size.y
	var x_position: int = (rand_position % width) * fruit_size.x
	
	print(rand_position, x_position, y_position)

	var new_position = Vector2(top_left_position)
	new_position.y += y_position
	new_position.x += x_position
	
	# randomize
	return new_position

func spawn_fruit(fruit):
	if fruit and is_instance_valid(fruit):
		return fruit
	
	var new_fruit = fruit_scene.instantiate()
	new_fruit.position = get_fruit_position()
	#instance.position = Vector2i(0,0)
	add_child(new_fruit)
	#print(fruit.get_overlapping_areas())

	return new_fruit

func _process(delta: float) -> void:
	var idx = 0
	while idx < len(fruits):
		fruits[idx] = spawn_fruit(fruits[idx])
		idx += 1
	#for fruit in len(fruits):
		#spawn_fruit()
	
	if snake and is_instance_valid(snake):
		#print(snake)
		#print(snake.body_parts)
		#score = snake.get_score()
		
		$GameUI/Score.text = "SCORE: " + str(len(snake.body_parts))
		$GameUI/Position.text = "" + str(Vector2i(snake.position))


func snake_death() -> void:
#	https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html
	print("snake death")
	
	snake.queue_free()
	
	call_deferred("create_snake_head")
	
	

func create_snake_head() -> void:
	
	if snake and is_instance_valid(snake):
		snake.queue_free()
	
	snake = snake_body_scene.instantiate()
	#instance.position = Vector2i(0,0)
	add_child(snake)
	
	snake.connect("death", snake_death)
	#timer.timeout.connect(_on_timer_timeout)

	#snake = instance
	
	

func _ready() -> void:
	var seed_int := hash(seed)
	#seed_int = "123"
	rng.seed = seed_int
	

	create_snake_head()
	
	#print("handle_grow", grow_tail_at)
	#instance.position = grow_tail_at
##	https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
	#
	#parent.add_child(instance)
	#tail = instance
	#
	#body_parts.append(tail)
	pass
