extends KinematicBody2D

var velocity : Vector2 

onready var timer : Timer = $Timer
var timer_is_playing : bool = false

export var max_jump_power : int = 900
var jump_reduction : int = 200

export var speed : int = 600
var GRAVITY : int = 19.8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocity.y += GRAVITY
	
	move_and_slide(velocity, Vector2.UP) # applies overall movement
	
	
func _input(event):
	
	velocity.x = get_vector_x() * speed # set left-right movement with speed
	
	if Input.is_action_just_pressed("Jump"): # starts calculating time for jump power
		timer.start()
		timer_is_playing = true

	if Input.is_action_just_released("Jump") && timer_is_playing == true: # when jump is released while timer is playing
		jump(-max_jump_power + (jump_reduction * ((timer.time_left)/timer.wait_time))) # take the max jump power and reduce by the time left
		timer.stop() # reset timer
		timer_is_playing = false
		
func get_vector_x():
	return Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left") # get movement on x axis

func jump(jump_power): # set movement to jump
	if is_on_floor():
		print("jump")
		velocity.y = jump_power

func _on_Timer_timeout(): # when jump button is held for too long 
	jump(-max_jump_power) # jumps and reset timer
	timer_is_playing = false
	
