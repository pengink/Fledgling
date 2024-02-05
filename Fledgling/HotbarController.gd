extends Container


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var camera = Camera2D
var scroll_index = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	pass
	if Input.is_action_just_pressed("scroll_down"):
		scroll_index += 1
	if Input.is_action_just_pressed("scroll_up"):
		pass
		scroll_index += 1
		
	if scroll_index > 31 or scroll_index < 0:
		pass
		
	scroll_index = clamp(scroll_index,0, 30)
		
		
