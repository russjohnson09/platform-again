


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
