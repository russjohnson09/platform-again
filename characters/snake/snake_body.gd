extends Node2D


var last_position: Vector2i
var tail

var test = ""

#move_to

#func add(body):
	#print("add", body)
	#tail = body
	#print("add", tail)

#Stack overflow (stack size: 1024). Check for infinite recursion in your script.




func move_to(move_to: Vector2i):
	last_position = position
	
	#print("move_to", tail)
	#print("test:", test)
	if tail:
		tail.move_to(last_position)
	# if growing ...
	position = move_to
