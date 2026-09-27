extends Node2D


func _on_kai_player_out_of_bounds() -> void:
	$Kai.global_position = Vector2(0,0)
	pass # Replace with function body.


func _on_cobra_player_out_of_bounds() -> void:
	$Kai.global_position = Vector2(0,0)
	
	$Cobra.reset()
	$Cobra.global_position = Vector2(0,0)
	
	pass # Replace with function body.
