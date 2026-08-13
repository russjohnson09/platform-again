extends Area2D




func _exit_tree() -> void:
#Called when the node is about to leave the SceneTree (e.g. upon freeing, scene changing, or after calling remove_child() in a script). If the node has children, its _exit_tree() callback will be called last, after all its children have left the tree.
	
	get_parent().queue_free()
	pass
