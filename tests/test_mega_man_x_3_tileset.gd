extends Node2D




func _ready() -> void:
	var speed := 1.0
	$Platform1Animation.play("new_animation", -1, speed)
