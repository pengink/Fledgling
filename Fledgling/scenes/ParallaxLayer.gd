extends ParallaxLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	match randi() % 3:
		0:
			get_node("Map").set_texture(load("res://Tileset/map.png"))
		1:
			get_node("Map").set_texture(load("res://Tileset/Soaring Willows.png"))
		2:
			get_node("Map").set_texture(load("res://Tileset/Isle of Songs.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
