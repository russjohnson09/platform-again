extends Node2D





func get_overlapping_areas():
	return $Area2D.get_overlapping_areas()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("fruit ", area)
	print("fruit ", area.get_groups())
	print("fruit ", area.is_in_group("tail"), area.is_in_group("body"))
	if area.is_in_group("tail"):
		queue_free()
		pass
	pass # Replace with function body.
