extends Node2D


func _ready() -> void:
	#$AnimatedSprite2D.play()
	#$AnimatedSprite2D.frame = 0
	#start_animation()
	

	pass

func start_animation() -> void:
	# sync up animations
	#print("sync")
	#$AnimatedSprite2D2.frame = $AnimatedSprite2D.frame
	#$AnimatedSprite2D3.frame = $AnimatedSprite2D.frame
	#
	#$AnimatedSprite2D.play()
	#$AnimatedSprite2D2.play()
	#$AnimatedSprite2D3.play()
	
	pass

#func _on_animated_sprite_2d_animation_looped() -> void:
	##start_animation()
	#pass # Replace with function body.


func _on_button_pressed() -> void:
	
	if DebugMenu.style ==  DebugMenu.Style.VISIBLE_DETAILED:
		DebugMenu.style = DebugMenu.Style.HIDDEN
	else:
		DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED

	pass # Replace with function body.
