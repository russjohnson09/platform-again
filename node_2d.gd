extends Node2D





func _on_button_2_pressed() -> void:

	get_tree().change_scene_to_file("res://tests/GravityCircuit1.tscn")
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().quit()

	pass # Replace with function body.


func _on_button_3_pressed() -> void:
#	https://docs.godotengine.org/en/latest/tutorials/scripting/change_scenes_manually.html

	get_tree().change_scene_to_file("res://tests/TestMovingBackgroundClouds.tscn")

	pass # Replace with function body.
