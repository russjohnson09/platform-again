extends Node2D



#https://docs.godotengine.org/en/4.6/tutorials/2d/2d_transforms.html


func _ready() -> void:
	
#	https://github.com/godot-extended-libraries/godot-debug-menu
	#DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED
	pass

func _on_button_pressed() -> void:
	
	if 	DebugMenu.style == DebugMenu.Style.VISIBLE_DETAILED:
		DebugMenu.style = DebugMenu.Style.HIDDEN
	else:
		DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED

	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	$Node2D/Parallax2D.autoscroll *= 2
	
	if $Node2D/Parallax2D.autoscroll.x < -100000:
		$Node2D/Parallax2D.autoscroll = Vector2(-100,100)
	
	pass # Replace with function body.
