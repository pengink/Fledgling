extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var camera : Camera2D 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if camera != null:
		print(camera.transform.get_origin())
		self.rect_position = camera.get_camera_screen_center()
		


func _on_Player_tree_entered():
	camera = get_parent().get_parent().get_node("Player").get_node("Camera2D")
	print(camera)
