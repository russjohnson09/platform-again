extends Node2D
#https://github.com/godotengine/godot-demo-projects/blob/master/audio/mic_record/MicRecord.gd
#https://www.youtube.com/watch?v=cMEw2XQOgXM
#  WARNING: servers/audio/audio_server.cpp:1854 - You must enable the project setting "audio/driver/enable_input" to use audio capture.

# Is he using a plugin to automatically set this to an onready var?
# I do like this that the script doesn't refer to the object directly.
@onready var progress_bar: ProgressBar = $ProgressBar

@onready var input_device: OptionButton = $InputDevice

@onready var timer_record_limit: Timer = 	$TimerLimitRecord

var recording: AudioStreamWAV
#var stereo: bool = true
#var mix_rate := 44100  # This is the default mix rate on recordings.
#var format := AudioStreamWAV.FORMAT_16_BITS  # This is the default format on recordings.

var is_recording = false
var record_effect

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
		
	record_effect = AudioServer.get_bus_effect(recordIndex, 0)
	record_effect.set_recording_active(is_recording)
	print(record_effect.is_recording_active())
	print(is_recording)


func request_record_permissions() -> void:
	# Check if the user has already granted the permission
	if OS.request_permission("RECORD_AUDIO"):
		print("do record")
		
		
		pass
		## Trigger the native Android permission popup dialog box
		#OS.request_permission("RECORD_AUDIO")
		#
		## Pause execution briefly and wait for the user response signal
		#await get_tree().on_request_permissions_result
		#
		## Re-verify the outcome of the user action
		#if OS.has_permission("RECORD_AUDIO"):
			#print("Microphone access granted by user.")
			#setup_audio_recording()
		#else:
			#print("Microphone access denied by user.")
			#show_permission_warning()
	#else:
		## Permission is already available from a previous app launch
		#setup_audio_recording()
	

#https://github.com/godotengine/godot-demo-projects/tree/master/audio/mic_record

#https://docs.godotengine.org/en/stable/tutorials/audio/recording_with_microphone.html
func _process(delta: float) -> void:
	var current_db = AudioServer.get_bus_peak_volume_left_db(recordIndex, 0)	
#	Converts from decibels to linear energy (audio).
	# value from 0 - 1 converted from decibels built in godot function
	var magnitude = db_to_linear(current_db)
	progress_bar.value = magnitude  * progress_bar.max_value
	
	$TimerLabel.text = str(int(timer_record_limit.time_left))
	
	
	#print(record_effect.is_recording_active())

	if record_effect.is_recording_active():
		#$RecordLabel.text = "Recording"
		$RecordButton.text = "Press To Stop Recording"

	else:
		#$RecordLabel.text = ""
		$RecordButton.text = "Press To Record"
		


func _on_input_device_item_selected(index: int) -> void:
	print(index)
	print(capture_list[index])
	
	
	
	AudioServer.set_input_device(capture_list[index])
	pass # Replace with function body.

#https://github.com/godotengine/godot-demo-projects/blob/master/audio/mic_record/MicRecord.gd
func start_stop_recording():
	if not OS.request_permission("RECORD_AUDIO"):
		return
	
	if record_effect.is_recording_active():
		stop_recording()
		return
	#is_recording = true
	record_effect.set_recording_active(true)
	
	print("do record")
	timer_record_limit.start(60)
	
func stop_recording():
	if not record_effect.is_recording_active():
		return
	timer_record_limit.stop()

	recording = record_effect.get_recording()

	# don't mess with these after the fact or lookup how to adjust these properly.
	#recording.set_mix_rate(mix_rate)
	#recording.set_format(format)
	#recording.set_stereo(stereo)
	
	record_effect.set_recording_active(is_recording)

	




func _on_timer_limit_record_timeout() -> void:
	stop_recording()
	pass # Replace with function body.


func _on_play_button_pressed() -> void:
	stop_recording()
	
	if not recording:
		return
	
	print_rich("\n[b]Playing recording:[/b] %s" % recording)
	print_rich("[b]Format:[/b] %s" % ("8-bit uncompressed" if recording.format == 0 else "16-bit uncompressed" if recording.format == 1 else "IMA ADPCM compressed"))
	print_rich("[b]Mix rate:[/b] %s Hz" % recording.mix_rate)
	print_rich("[b]Stereo:[/b] %s" % ("Yes" if recording.stereo else "No"))
	var data := recording.get_data()
	print_rich("[b]Size:[/b] %s bytes" % data.size())
	$AudioStreamPlayer2.stream = recording
	$AudioStreamPlayer2.play()
	
	
	pass # Replace with function body.


func _on_record_button_pressed() -> void:
	start_stop_recording()
	
	#if is_recording:
		##if OS.get_name() == "Android":
		#start_recording()
	#else:
		#stop_recording()
