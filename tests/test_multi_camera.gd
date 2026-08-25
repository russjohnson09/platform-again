extends Node2D



#https://docs.godotengine.org/en/stable/tutorials/rendering/viewports.html



func _ready():
	
	$SubViewportContainer/SubViewport.world_2d = get_viewport().world_2d
	
	#$SubViewport.world_2d = get_viewport().world_2d
	#world_2d = get_viewport().world_2d
	pass
	
	
func _physics_process(delta: float) -> void:
	
	$SubViewportContainer/SubViewport/Camera2D.position = $Snake.position
