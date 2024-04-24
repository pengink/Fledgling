extends Container

export var difference : int = 5
onready var holderTexture = load("res://Tileset/Holder.png")
onready var selectedTexture = load("res://Tileset/output-onlinepngtools.png")
var camera : Camera2D
var scroll_index : int = 0
var item = 0

func _input(event):
	if Input.is_action_just_pressed("scroll_down"):
		scroll_index -= 1
		if scroll_index < 0:
			scroll_index = difference * 4
	if Input.is_action_just_pressed("scroll_up"):
		scroll_index += 1
		if scroll_index > difference * 4:
			scroll_index = 0
	
	scroll_index = clamp(scroll_index, 0, difference * 4)
	get_range()

	
func get_range():
	for i in 4: # GRAAAAAAHHHHHHHHH
		if scroll_index >= difference*i and scroll_index < difference*i + 1:
			get_child(i).texture = selectedTexture;
			#get_child(i).set_scale(Vector2(0.5, 0.5));
			item = i;
			print(item)
		elif i != item:
			get_child(i).texture = holderTexture;
			
func selector():
	pass
	# if this then change item you know you get?
	

	
# According to all known laws of aviation, there is no way a bee should be able to fly. Its wings are too small to get its fat little body off 
# hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh try to stay awake WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP WAKE UP

