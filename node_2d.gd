extends Node2D
#https://www.youtube.com/watch?v=cMEw2XQOgXM

# Is he using a plugin to automatically set this to an onready var?
# I do like this that the script doesn't refer to the object directly.
@onready var progress_bar: ProgressBar = $ProgressBar

@onready var input_device: OptionButton = $InputDevice

var recordIndex

var capture_list

func _ready() -> void:
	recordIndex = AudioServer.get_bus_index("RecordingBus")
	
	print(recordIndex)
	
	print(AudioServer.bus_count)
	
#	https://shaggydev.com/2022/07/14/godot-microphone/
	#var capture_list = AudioServer.capture_get_device_list()
	capture_list = AudioServer.get_input_device_list()
#	["Default", "Microphone (HD Webcam eMeet C950)", "Microphone (Realtek(R) Audio)"]
	
	print(capture_list)
	
	input_device.clear()
	
	for input in capture_list:
		input_device.add_item(input)
	
	

#https://github.com/godotengine/godot-demo-projects/tree/master/audio/mic_record

#https://docs.godotengine.org/en/stable/tutorials/audio/recording_with_microphone.html
func _process(delta: float) -> void:
	var current_db = AudioServer.get_bus_peak_volume_left_db(recordIndex, 0)
	
	print(current_db)
	
#	Converts from decibels to linear energy (audio).
	# 0 - 1
	var magnitude = db_to_linear(current_db) * progress_bar.max_value
	
	progress_bar.value = magnitude
	


func _on_input_device_item_selected(index: int) -> void:
	print(index)
	print(capture_list[index])
	
	
	
	AudioServer.set_input_device(capture_list[index])
	pass # Replace with function body.
	
	
	
