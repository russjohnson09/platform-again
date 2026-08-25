extends Node2D

var haptics: AndroidHaptics


func _ready() -> void:
	DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED
	
	print(OS.get_granted_permissions())
	print("can record audio", OS.request_permission("RECORD_AUDIO"))
	print("can vibrate", OS.request_permission("VIBRATE"))
	
	
	$Permissions.text = "Permissions: " + str(OS.get_granted_permissions()) + "\n"
	$Permissions.text += "\nVibrate: " + str(OS.request_permission("VIBRATE"))
	$Permissions.text += "\nFOO: " + str(OS.request_permission("FOO"))

	haptics = AndroidHaptics.new()


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


func _on_touch_screen_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://tests/TestSnake.tscn")


func _on_vibrate_pressed() -> void:
	#print("start")
	#Input.vibrate_handheld()
	
	var effectType: AndroidHaptics.Effect = AndroidHaptics.Effect.CLICK
	
	haptics.vibrateEffect(effectType)

	pass # Replace with function body.


func _on_vibrate_2_pressed() -> void:
	#var vibrate_time = int($TextEdit.text)
	#print(vibrate_time)
	#Input.vibrate_handheld(vibrate_time)
	#print(vibrate_time)

	pass # Replace with function body.
