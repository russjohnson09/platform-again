extends Node2D





func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio += (delta / 10)
	
	pass
