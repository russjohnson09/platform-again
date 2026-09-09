extends CharacterBody2D


var calculated_velocity = Vector2(0,0)

var last_position = Vector2(0,0)

#var max_velocity = Vector2(0,0)
#
func _physics_process(delta: float) -> void:
	var current_position = global_position
	var change_in_position = current_position - last_position
	
	var calculated_velocity = (change_in_position / delta)
	last_position = current_position
	$velocity.text = str(velocity) # + "\n" + str(max_velocity) 
	
	$velocity.text += "\n" + str(calculated_velocity) # + "\n" + str(max_velocity) 

	#
	##velocity.x = 100.0
	#velocity.y = 0.0
	##var speed = 10.0
	#var speed =  abs(max_velocity.x)
	#velocity.x = move_toward(velocity.x, max_velocity.x, speed * delta)
#
	#
#
	#
	#move_and_slide()
	##move_toward(5, 10, 4)
#
	##move_and_collide(velocity)
	#
