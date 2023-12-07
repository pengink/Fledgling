extends KinematicBody2D

var velocity : Vector2 

var jumped : bool = false
var gliding : bool = false

export var max_jump_power : int = 900

export var speed : int = 600
var GRAVITY : float = 19.8
var glideOffset : int = 40

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if !is_on_floor():
		velocity.y += GRAVITY
		if gliding == true:
			velocity.y = velocity.dot(Vector2.DOWN)/90
			
	move_and_slide(velocity, Vector2.UP) # applies overall movement
	
	
func _input(event):
	
	velocity.x = get_vector_x() * speed # set left-right movement with speed
	
	if Input.is_action_just_pressed("Jump"): 
		if is_on_floor():# starts calculating time for jump power
			jumped = true
			jump()
		else:
			glide()
			
	if is_on_floor(): 
		jumped = false
		gliding = false
		
func get_vector_x():
	return Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left") # get movement on x axis

func jump(): # set movement to jump
		print("jump")
		velocity.y = -max_jump_power

func glide():
	match gliding:
		true:
			gliding = false
		false:
			gliding = true
