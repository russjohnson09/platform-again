extends CanvasLayer

@export var input_prefix = "p1_"


func _on_right_btn_pressed() -> void:
	
	Input.action_press(input_prefix + "right")
	pass # Replace with function body.


func _on_right_btn_released() -> void:
	Input.action_release(input_prefix + "right")
	pass # Replace with function body.


func _on_left_btn_pressed() -> void:
	Input.action_press(input_prefix + "left")
	pass # Replace with function body.


func _on_left_btn_released() -> void:
	Input.action_release(input_prefix + "left")
	pass # Replace with function body.
	


func _on_up_btn_pressed() -> void:
	Input.action_press(input_prefix + "up")

	pass # Replace with function body.


func _on_up_btn_released() -> void:
	Input.action_release(input_prefix + "up")

	pass # Replace with function body.


func show_hide_debug():
	
	if 	DebugMenu.style == DebugMenu.Style.VISIBLE_DETAILED:
		DebugMenu.style = DebugMenu.Style.HIDDEN
	else:
		DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED


func _on_down_btn_pressed() -> void:
	Input.action_press(input_prefix + "down")

	pass # Replace with function body.


func _on_down_btn_released() -> void:
	Input.action_release(input_prefix + "down")

	pass # Replace with function body.
