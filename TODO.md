


Controller on phone doesn't work well.

I want the button to release after a move off of it without requiring me to take my finger off the screen.


An analog stick might be better for the left right.


https://godotengine.org/asset-library/asset/1787


#  ERROR: The Project Setting 'emulate_mouse_from_touch' should be set to False
I think only one of emulate_touch_from_mouse and emulate_mouse_from_touch should be set?



Snake game.


Head spawns a piece of the body. This is the rear tail if no next piece of the body exists or the body if one does.

Movement is ever x seconds. There is fps which I think is the image on the screen and not the physics fps.

Anyways ever 1 / 3 second approximately is probably good.

```
movement_float = 0.0

movement_float += delta

if movement_float >= 0.33.

    movement_float -= 0.33

    # do one movement in the direction you are facing.
```


position should preferablly be whole ints. The collision will be a smaller circle inside the rect image placeholder.


# Snake Game
I ran into a stack overflow and fixed it by removing the recursive call but I think this could have been fixed with call_deferred

https://forum.godotengine.org/t/what-is-the-difference-between-queue-free-and-call-deferred-queue-free/56643

https://www.reddit.com/r/godot/comments/17yvwnp/in_which_cases_do_you_use_call_deferred/


https://www.reddit.com/r/godot/comments/vpa15i/just_a_little_win_today_i_got_a_recursive/


https://docs.godotengine.org/en/stable/classes/class_object.html#class-object-method-call

https://github.com/godotengine/godot/issues/115311#issuecomment-3792608946


```
func check():
	for limit in 10000:
		recursive(limit)
		print(limit)

func recursive(limit, i=0):
	if i < limit:
		recursive(limit, i+1)
```