extends Node2D


@export var speed := 1.0


func _ready() -> void:
	
	$AnimationPlayer.play(&"new_animation", -1, speed)
