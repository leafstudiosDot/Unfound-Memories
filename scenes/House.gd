extends Node2D


var mirrorInteracted = false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false)
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_E):
		mirrorInteracted = true
		print(mirrorInteracted)
		print("Mirror Reflected")
	pass


func _on_Area2D_body_entered(body):
	set_process_input(true)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	set_process_input(false)
	pass # Replace with function body.
