extends Node2D




func _ready() -> void:
	$AnimationPlayer.play(&"default")
	
	$AnimationPlayer2.play(&"default", -1, 0.5)
	
	pass
