extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false)
	pass # Replace with function body.


func _input(event):
	if Input.is_key_pressed(KEY_E):
		get_tree().change_scene("res://scenes/Streets.tscn")
	pass


func _on_Area2D_body_entered(body):
	set_process_input(true)
	print("Body Entered")
	pass # Replace with function body.



func _on_Area2D_body_exited(body):
	set_process_input(false)
	print("Body Exited")
	pass # Replace with function body.
