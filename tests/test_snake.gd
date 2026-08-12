extends Node2D


#https://www.reddit.com/r/godot/comments/17o1mkz/instantiate_vs_new/
#https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html
#https://docs.godotengine.org/en/stable/classes/class_packedscene.html#class-packedscene

var snake_body_scene = preload("res://characters/snake/SnakeHead.tscn")



#var snake: PackedScene

#var snake: Node2D
var snake

@onready var snake_head_spawn_point = $"."

func _process(delta: float) -> void:
	
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
