extends Node2D


@onready var recording_dad = $Recorder
@onready var recording_parker = $Recorder2
@onready var recording_mom = $Recorder3

@onready var recording = $Recorder

@onready var recording_option = $Recorder/OptionButton


func update_recording_page_main(page: int, recorder, prefix: String) -> void:
	
	if not recorder:
		print("recorder is not ready", recorder)
		return
	var new_save_name = prefix + "_tell_tale" + str(page) + ".wav"
	recorder.save_name = new_save_name
	print(recorder.save_name)


func update_recording_page(page: int) -> void:
	if not is_node_ready():
		return
	var prefix_id = recording_option.get_selected_id()
	var prefix = recording_option.get_item_text(prefix_id)
	print(prefix)

	update_recording_page_main(page, recording, prefix )
	#update_recording_page_main(page, recording_mom, "mom")
	#update_recording_page_main(page, recording_parker, "parker")
	

func _ready():
	
	update_recording_page($TellTaleStory.pageIdx)

func _on_tell_tale_story_page_update(page: int) -> void:
	if not is_node_ready():
		return
	update_recording_page(page)


func _on_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	update_recording_page($TellTaleStory.pageIdx)
	pass # Replace with function body.
