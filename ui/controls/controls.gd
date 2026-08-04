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
	Input.action_press(input_prefix + "jump")

	pass # Replace with function body.


func _on_up_btn_released() -> void:
	Input.action_release(input_prefix + "jump")

	pass # Replace with function body.


func show_hide_debug():
	
	if 	DebugMenu.style == DebugMenu.Style.VISIBLE_DETAILED:
		DebugMenu.style = DebugMenu.Style.HIDDEN
	else:
		DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED

func _on_debug_btn_pressed() -> void:
	show_hide_debug()


func _on_down_btn_pressed() -> void:
	pass # Replace with function body.


func _on_down_btn_released() -> void:
	pass # Replace with function body.

	
func _on_action_1_pressed() -> void:
	Input.action_press(input_prefix + "jump")

	pass # Replace with function body.


func _on_action_1_released() -> void:
	Input.action_release(input_prefix + "jump")

	pass # Replace with function body.
