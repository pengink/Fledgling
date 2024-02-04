extends Camera2D

var scroll_index : float = 1
var sensitivity : float = 0.1
var current_zoom : Vector2 = Vector2(1.0, 1.0)
var target_zoom : float = 1.0

var dt : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	dt += delta * 0.4
	zoom = lerp(zoom, Vector2(target_zoom, target_zoom), dt)
	#zoom = Vector2(current_zoom, current_zoom)
	

func _input(event):
	pass
	if event is InputEventMouseButton:
		if Input.is_action_pressed("scroll_up"):
			scroll_index += sensitivity
		elif Input.is_action_pressed("scroll_down"):
			scroll_index -= sensitivity
		scroll_index = clamp(scroll_index, 0, 2)
		
		match scroll_index:
			0.0:
				if target_zoom != 0.5:
					print("low")
					current_zoom = zoom
					target_zoom = 0.5
				
			2.0: 
				if target_zoom != 2.0:
					print("high")
					current_zoom = zoom
					target_zoom = 2.0
				
		if scroll_index >= 0.25 && scroll_index <= 0.75:
			if target_zoom != 1.0:
				print("mid")
				current_zoom = zoom
				target_zoom = 1.0
		
