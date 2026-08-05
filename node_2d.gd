extends Node2D



func _ready() -> void:
	DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED


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

# armadillo
#https://www.youtube.com/watch?v=S4JOJNTGaUs
func _on_button_4_pressed() -> void:
	
	get_tree().change_scene_to_file("res://tests/MegaMan2Parallax.tscn")

	pass # Replace with function body.


func _on_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://tests/TestMegaMan2Tileset.tscn"
)

	pass # Replace with function body.


func _on_button_6_pressed() -> void:
	
	get_tree().change_scene_to_file("res://tests/TestMegaManX3Tileset.tscn")

	pass # Replace with function body.


func _on_touch_screen_button_pressed() -> void:
	get_tree().change_scene_to_file("res://tests/TestMegaManX3Tileset.tscn")
	pass # Replace with function body.
