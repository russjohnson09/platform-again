extends Node2D

# An array implementation is probably just better.
# The call deferred is okay but just having the head
# of the snake keep an array of all body parts is better generally.
@export var limit = 100000

func check():
	#for limit in 10000:
		#recursive(limit)
		##print(limit)
		#$Label.text = str(limit)
		
	#for limit in 10000:
	$Label.text = str(0)

	recursive(limit)
	$Label.text = str(limit)

func recursive(limit, i=0):
	if i < limit:
		#call_thread_safe()
		
		call_deferred("recursive", limit, i+1)
		#call_thread_safe("recursive", limit, i+1)
		#call("recursive", limit, i+1)

		#recursive(limit, i+1)
		
		


func _on_button_pressed() -> void:
	check()
	pass # Replace with function body.
