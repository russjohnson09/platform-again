extends Area2D


@onready var bear = $".."

func _ready():
	print("area ready")
	print("bear")
	
func play_bear_song():
	
	print("playing bear song")
	
	bear.play_bear_song()
