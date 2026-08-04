extends Node2D




func _ready() -> void:
	var speed := 1.0
	$Platform1Animation.play("new_animation", -1, speed)
	#$Platform1Animation2.play("new_animation", -1, speed)


func _on_kai_player_out_of_bounds() -> void:
	$Kai.position = $Spawn1.position
	pass # Replace with function body.
