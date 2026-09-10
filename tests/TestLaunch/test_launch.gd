extends Node2D




func _ready() -> void:
	#$BlizzardPlatform1/AnimationPlayer.play("new_animation")
	$Node2D/BlizzardPlatform1/AnimationPlayer.play("new_animation")
	$Node2D2/BlizzardPlatform1/AnimationPlayer.play("new_animation")
	$Node2D3/BlizzardPlatform1/AnimationPlayer.play("new_animation")
	$Node2D4/BlizzardPlatform1/AnimationPlayer.play("new_animation")
	$Node2D5/BlizzardPlatform1/AnimationPlayer.play("new_animation")
	$Node2D6/BlizzardPlatform1/AnimationPlayer.play("new_animation")
	
	pass
	
	
func _on_kai_player_out_of_bounds() -> void:
	$Kai.position = $Spawn1.position
	pass # Replace with function body.
