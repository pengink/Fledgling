extends Container


onready var pivot : Node2D = get_node("Pivot")
export var difference : int = 3
var camera : Camera2D
var scroll_index : int = 0
var item : int = 0

func _ready():
	for i in pivot.get_child_count():
		pass
		get_child(i).rect_global_position = pivot.get_child(i).global_position #GRAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH

func _process(delta):
	if round(pivot.rotation_degrees) == 270.0 and item == 0:
		pass
		item = 4
		
	pivot.rotation_degrees = lerp(pivot.rotation_degrees, 90 * item, delta * 7)
	
	if item == 4:
		item = 0

	print(int(round(pivot.rotation_degrees)))
	print(item)
	
	for i in pivot.get_child_count():
		get_child(i).rect_global_position = pivot.get_child(i).global_position # GRAHHHHHHHHHHHHHHHHHHHH
	

		
	

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
	pass
	for i in 4:
		if scroll_index >= difference*i and scroll_index < difference*i + 1:
			item = i

	
