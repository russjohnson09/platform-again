extends AnimatedSprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer 


func _ready() -> void:
	print("ready")
	
	
	
func play_bear_song():
	
	print("playing bear song")
	
	animation_player.play("new_animation")
	
