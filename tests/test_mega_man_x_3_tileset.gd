extends Node2D




func _ready() -> void:
	var speed := 1.0
	$Platform1Animation.play("new_animation", -1, speed)
	#$Platform1Animation2.play("new_animation", -1, speed)
	
	#_platform_1_timer()
	$BlizzardPlatform2/AnimationPlayer.play("new_animation")


func _on_kai_player_out_of_bounds() -> void:
	$Kai.position = $Spawn1.position
	pass # Replace with function body.


#func _platform_1_timer() -> void:
	#
	#if $BlizzardPlatform1.max_velocity.x > 0.0:
		#$BlizzardPlatform1.max_velocity.x = -1000.0
	#else:
		#$BlizzardPlatform1.max_velocity.x = 1000.0
	#
	#pass # Replace with function body.
