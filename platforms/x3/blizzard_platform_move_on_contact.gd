extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("new_animation")
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	$AnimationPlayer.pause()
	pass # Replace with function body.
