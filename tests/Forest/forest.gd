extends Node2D


func _on_kai_player_out_of_bounds() -> void:
	$Kai.global_position = Vector2(0,0)
	pass # Replace with function body.


func _on_cobra_player_out_of_bounds() -> void:
	$Kai.global_position = Vector2(0,0)
	
	$Cobra.reset()
	$Cobra.global_position = Vector2(0,0)
	
	pass # Replace with function body.


func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://tests/Forest/Forest.tscn")


func _physics_process(delta: float) -> void:
	
	$Bird.position += (delta * Vector2(-1.0,0))
	$Bird2.position += (delta * Vector2(-5.0,0))
	$Bird3.position += (delta * Vector2(-50.0,0))
	$Bear2.position += (delta * Vector2(-50.0,0))


#func _on_area_2d_body_entered(body: Node2D) -> void:
	## This doesn't apply to all node2d objects which I assumed incorrectly
	## to also include area2d.
	##body_entered(body: Node2D)
##Emitted when the received body enters this area. body can be a PhysicsBody2D or a TileMap. TileMaps are detected if their TileSet has collision shapes configured. Requires monitoring to be set to true.
#
	#print("bear entered", body)
	#pass # Replace with function body.




func _on_cobra_action_area_entered(area: Area2D) -> void:
	print("_on_cobra_action_area_body_entered", area)
#	trigger bear song on bear entered.
	if area.is_in_group("bear"):
		print("start bear song")
		area.play_bear_song()
		pass
	pass # Replace with function body.
