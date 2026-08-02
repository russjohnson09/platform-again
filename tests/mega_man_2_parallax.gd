extends Node2D




func _ready() -> void:
	
	DebugMenu.style = DebugMenu.Style.VISIBLE_DETAILED


func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio += (delta / 10)
	
	pass
