extends Node2D

@export var max_record_time = 15
@export var save_name: String = "test.wav"
@onready var timer_record_limit: Timer = 	$TimerLimitRecord
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var record_countdown: Label = $RecordCountdown

@onready var record_audiostream: AudioStreamPlayer = $AudioStreamPlayer
@onready var playback_audiostream: AudioStreamPlayer = $AudioStreamPlayer2

var recording: AudioStreamWAV
var record_index
var record_effect


func _ready() -> void:
	record_index = AudioServer.get_bus_index("RecordingBus")
	record_effect = AudioServer.get_bus_effect(record_index, 0)

func update_recording_volume_bar():
	var current_db = AudioServer.get_bus_peak_volume_left_db(record_index, 0)	
	var magnitude = db_to_linear(current_db)
	progress_bar.value = magnitude  * progress_bar.max_value
	pass

func _process(delta: float) -> void:

	update_recording_volume_bar()
	if timer_record_limit.is_stopped():
		record_countdown.text = ""
	else:
		record_countdown.text = str(int(timer_record_limit.time_left))
	
	if record_effect.is_recording_active():
		#$RecordLabel.text = "Recording"
		$RecordButton.text = "Press To Stop Recording"
	else:
		$RecordButton.text = "Press To Record"
		
	if playback_audiostream.playing:
		$PlayButton.text = "Stop"

	else:
		$PlayButton.text = "Play"
#https://github.com/godotengine/godot-demo-projects/blob/master/audio/mic_record/MicRecord.gd
func start_stop_recording():
	
	# stop if android does not have permission to record audio
	if not OS.request_permission("RECORD_AUDIO"):
		return
	
	if record_effect.is_recording_active():
		stop_recording()
		return
	record_effect.set_recording_active(true)
	timer_record_limit.start(max_record_time)
	
	
func stop_recording():
	if not record_effect.is_recording_active():
		return
	timer_record_limit.stop()

	recording = record_effect.get_recording()

	# don't mess with these after the fact or lookup how to adjust these properly.
	#recording.set_mix_rate(mix_rate)
	#recording.set_format(format)
	#recording.set_stereo(stereo)
	
	record_effect.set_recording_active(false)
	
	print(OS.get_user_data_dir() + "/" + save_name)
	recording.save_to_wav('user://%s' % save_name)
	
	# Set this to null to free up memory?
	# I think yes this might help but also just having the timer record limit to 
	# 15 seconds any longer and it should not be just in memory.
#	https://godotengine.org/asset-library/asset/5081
# It looks like this is a known issue.
	recording = null
	



func _on_timer_limit_record_timeout() -> void:
	stop_recording()
	pass # Replace with function body.


# To load an ogg at runtime you'll need to use AudioStreamOggVorbis.load_from_file()
func load_recording():
	# I always save after recording so this should always be here.
	var sound = AudioStreamWAV.load_from_file('user://%s' % save_name)
	recording = sound
	return recording

func _on_play_button_pressed() -> void:
	stop_recording()
	load_recording()
	
	if playback_audiostream.playing:
		playback_audiostream.stop()
		return
	if not recording:
		return
	
	print_rich("\n[b]Playing recording:[/b] %s" % recording)
	print_rich("[b]Format:[/b] %s" % ("8-bit uncompressed" if recording.format == 0 else "16-bit uncompressed" if recording.format == 1 else "IMA ADPCM compressed"))
	print_rich("[b]Mix rate:[/b] %s Hz" % recording.mix_rate)
	print_rich("[b]Stereo:[/b] %s" % ("Yes" if recording.stereo else "No"))
	var data := recording.get_data()
	print_rich("[b]Size:[/b] %s bytes" % data.size())
	
	playback_audiostream.stream = recording
	playback_audiostream.play()


func _on_record_button_pressed() -> void:
	start_stop_recording()
