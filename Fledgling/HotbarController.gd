extends Container

onready var select = get_node("Select")
export var difference : int = 5
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
	for i in 4:
		if scroll_index >= difference*i and scroll_index < difference*i + 1:
			item = i
			#select.rect_position = get_node("Slot" + str(item + 1)).rect_position
			select.rect_position.x = get_node("Slot" + str(item + 1)).rect_position.x - 7
			select.rect_position.y = get_node("Slot" + str(item + 1)).rect_position.y - 7
			
func selector():
	pass
	
	

	
