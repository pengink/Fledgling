extends Sprite

var rng = RandomNumberGenerator.new() # cite number generator

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var num : int = rng.randi_range(0, 5)
	print(num)
	match num:
		0:
			set_texture(load("res://Tileset/borderBark.png"));
		1:
			set_texture(load("res://Tileset/borderEyes.png"));
		2:
			set_texture(load("res://Tileset/borderFish.png"));
		3:
			set_texture(load("res://Tileset/borderShadow.png"));
		4:
			set_texture(load("res://Tileset/borderSkull.png"));
		5:
			set_texture(load("res://Tileset/borderVines.png")); 
	print("loaded")
