extends Node2D



#-[node name="Area2D" type="Area2D" parent="." unique_id=96417678 groups=["tail"]]
#+[node name="Area2D" type="Area2D" parent="." unique_id=96417678 groups=["body"]]

func get_overlapping_areas():
	return $Area2D.get_overlapping_areas()


func _on_area_2d_area_entered(area: Area2D) -> void:
	#print("fruit ", area)
	#print("fruit ", area.get_groups())
	## For some reason the group changes didn't seem to save but now they are??
	## There might be a difference between play scene and play main in terms of saving?
	#print("fruit ", area.is_in_group("tail"), area.is_in_group("body"))
	if area.is_in_group("tail"):
		queue_free()
		pass
	pass # Replace with function body.
