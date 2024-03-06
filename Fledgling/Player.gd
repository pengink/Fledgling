extends KinematicBody2D

var velocity : Vector2 

var jumped : bool = false
var gliding : bool = false

var state = ["idle", "walking", "jumping", "gliding"]
export var currentState = "walking"

onready var collider = $Area2D
onready var animatedSprite = get_node("AnimatedSprite")

export var jump_height : float = 100.0
export var time_to_peak : float = 3.0
export var time_to_descent : float = 5.0
export var glide_weight : float = 8.0
export var glide_velocity : float = 200.0

onready var jump_velocity : float = ((-2.0 * jump_height) / time_to_peak) 
onready var jump_gravity : float = ((2.0 * jump_height) / (time_to_peak * time_to_peak)) 
onready var fall_gravity : float = ((2.0 * jump_height) / (time_to_descent * time_to_descent)) 

export var speed : int = 700

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = get_vector_x() * speed
	
	if Input.is_action_just_pressed("Jump"): 
		if is_on_floor():
			jumped = true
			jump()
		else:
			glide()
			
	if is_on_floor(): 
		currentState = "walking" # rtk
			
	if gliding == false or get_vector_x() == 0:
		velocity.y += get_gravity() * delta
		if get_gravity() == jump_gravity:
			currentState = "Jumping"

	if gliding == true and get_vector_x() != 0:
		velocity.y = lerp(velocity.y, glide_velocity, delta * glide_weight) # WHY
		
	move_and_slide(velocity, Vector2.UP) # applies overall movement
	animation()
	
	
func _input(event):
	if is_on_floor(): 
		jumped = false
		gliding = false
		currentState = "walking" # rtk
		if get_vector_x() != 0:
			currentState = "walking"
	if get_vector_x() > 0:
		animatedSprite.flip_h = true
	elif get_vector_x() < 0:
		animatedSprite.flip_h = false
		
func get_vector_x():
	return Input.get_action_raw_strength("Right") - Input.get_action_raw_strength("Left") # get movement on x axis

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity
	
func jump(): # set movement to jump
		print("jump")
		currentState = "Jumping"
		velocity.y = jump_velocity
		
func glide():
	match gliding:
		true:
			gliding = false
		false:
			gliding = true
			currentState = "GLIDING"

func areaEntered(area):
	pass
	if area.is_in_group("Coin"):
		print("coin")
		
func pickup(item):
	pass
	item.get_parent().remove_child(item)
	print("krill")

func animation():
	match currentState:
		"GLIDING":
			animatedSprite.play("GLIDING")
			animatedSprite.set_scale(Vector2(1, 1))
		"walking":
			animatedSprite.play("Jumping")
			animatedSprite.set_scale(Vector2(1, 1))
		"Jumping":
			animatedSprite.play("Jumping")
			animatedSprite.set_scale(Vector2(1, 1))
	
