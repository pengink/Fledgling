extends AspectRatioContainer

var viewportRes : Vector2
var blockSequence : Array
var rng = RandomNumberGenerator.new()

var player : Node2D 

var viewportLast : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in round(viewportRes.y/64.0) + 1:
		newBlock(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if get_parent().get_parent().get_parent().get_parent().get_node("Player") != null: # need to direct to player
		player = get_parent().get_parent().get_parent().get_parent().get_node("Player")
		
	viewportRes = get_viewport_rect().size
	
	if on_viewport_resized():
		newBlock(blockSequence.size() + 1)
	else: return
	if player != null:
		for i in get_children().size() && player:
			get_child(i).offset.y += player.position.y
		

func on_viewport_resized():
	if abs(viewportLast.y-viewportRes.y) > 64: 
		viewportLast = viewportRes
		return true
		
func newBlock(order):
	var borderBlock = Sprite.new()
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
	blockSequence.append(num)
	add_child(borderBlock)
	borderBlock.position.x = 32
	borderBlock.position.y = (order * 64) + 32
