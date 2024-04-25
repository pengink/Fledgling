extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialog : String = "Dialog test"
var type_time : float = 0.05


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in dialog.length() + 1:
		yield(get_tree().create_timer(type_time), "timeout")
		text = dialog.left(i)

func _physics_process(delta):
	pass
