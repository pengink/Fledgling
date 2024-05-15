extends AspectRatioContainer

var viewportRes : Vector2

var blockSequence : Array
var rng = RandomNumberGenerator.new()
var boxScale : int = 4

var camera : Camera2D
var player : Node2D 
var viewportLast : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	viewportRes = get_viewport_rect().end
	for i in round(viewportRes.y/(32*boxScale)):
		newBlock(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		
	viewportRes = get_viewport_rect().size
	
	get_camera()
	updatePosition() 
	
	if blockSequence[0].offset.y > 32 * boxScale/2:
		print("up")
		newBlock(blockSequence.size() + 1)
		print(blockSequence.size() + 1)
	elif blockSequence[blockSequence.size()-1].offset.y > viewportRes.y: # WHAT DID YOU DO?????????
		pass
		print("down")
		
		

func on_viewport_resized():
	if abs(viewportLast.y-viewportRes.y) != 32 * boxScale: 
		viewportLast = viewportRes
		print("changed")
	#elif viewportLast.y-viewportRes

		
func newBlock(order):
	var borderBlock = Sprite.new()
	borderBlock.scale = Vector2(boxScale, boxScale)
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
		
	blockSequence.append(borderBlock)
	add_child(borderBlock)
	borderBlock.position.x = 32 * boxScale
	borderBlock.position.y = (order * 64 * boxScale) + 32

func updatePosition():
	for block in blockSequence:
		block.offset.y = -camera.global_position.y * 0.33
		
func get_camera():
	if get_parent().get_parent().get_parent().has_node("Player"):
		camera = get_parent().get_parent().get_parent().get_node("Player").get_node("Camera2D")
