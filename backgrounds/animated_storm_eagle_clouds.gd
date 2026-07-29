extends Node2D



@export var speed_scale = 4.0

# Clouds are 256 x 256.

# Clamp Loop Interpolation will set the animation back to zero on the loop.
# So I must move to a multiple of 256.

# 512 down and 256 to the left would work for example.


# Can I combine these into a single texture?

#https://www.reddit.com/r/godot/comments/qefyzo/how_combine_multiple_transformed_sprites_into_one/
#If you really really need to make the sprite in parts, you might want to put them in an atlas together so they can be batched.


# Single Atlas Texture


# Animated Texture ? Waterfalls and simple animations it looks like.




func _ready() -> void:
	$AnimationPlayer.speed_scale = speed_scale

	$AnimationPlayer.play('new_animation')
