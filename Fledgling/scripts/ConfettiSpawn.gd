extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	get_node("Confetti").visible = true
	get_node("Confetti").play("New Anim")
	if get_node("AudioStreamPlayer2D") != null:
		get_node("AudioStreamPlayer2D").play(0.0)


func _on_Confetti_animation_finished():
	queue_free()


func _on_AudioStreamPlayer2D_finished():
	get_node("AudioStreamPlayer2D").queue_free()
