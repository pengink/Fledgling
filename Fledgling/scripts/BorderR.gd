extends AspectRatioContainer

var viewportRes : Vector2

var blockSequence : Array
var rng = RandomNumberGenerator.new()
var boxScale : int = 2
var newBlock

var camera : Camera2D
var player : Node2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	viewportRes = get_viewport_rect().end
	player = get_tree().root.get_node("worldfinaltestreal").get_node("Player")
	camera = player.get_node("Camera2D")
	
	for i in (viewportRes.y / 128):
		blockSequence.append(newBlock())
		newBlock = blockSequence[i]
		add_child(newBlock)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("block: ", blockSequence[-1].global_position.y - 128, " camera: ", camera.global_position.y - 600)
		
	viewportRes = get_viewport_rect().size
	if blockSequence[0].global_position.y - 64 > camera.global_position.y - 600:
		blockSequence.push_front(newBlock())
		newBlock = blockSequence[0]
		add_child(newBlock)
		
	updatePosition() 


func newBlock():
	var borderBlock = Sprite.new()
	borderBlock.scale = Vector2(boxScale, boxScale)
	borderBlock.z_index = 2
	rng.randomize()
	var num : int = rng.randi_range(0, 5)
	match num:
		0:
			borderBlock.set_texture(load("res://Tileset/borderBark.png"));
		1:
			borderBlock.set_texture(load("res://Tileset/borderEyes.png"));
		2:
			borderBlock.set_texture(load("res://Tileset/borderFish.png"));
		3:
			borderBlock.set_texture(load("res://Tileset/borderShadow.png"));
		4:
			borderBlock.set_texture(load("res://Tileset/borderSkull.png"));
		5:
			borderBlock.set_texture(load("res://Tileset/borderVines.png")); 
		
	
	return borderBlock


func updatePosition():
	for i in self.get_child_count():
		get_child(i).position.y = 128 * -i + 600
		get_child(i).position.x = camera.global_position.x - (viewportRes.x/2) + 60
		
	#otherside.rect_position = 100
	
