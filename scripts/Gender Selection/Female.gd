extends RichTextLabel

export (Color,RGB) var mouse_over
export (Color,RGB) var mouse_out

onready var genderPicked = get_node("/root/Node2D/CanvasLayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Female_mouse_entered():
	set_modulate(mouse_over)
	pass # Replace with function body.


func _on_Female_mouse_exited():
	set_modulate(mouse_out)
	pass # Replace with function body.


func _on_Female_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		print("Picked Female")
		#genderPicked.GenderChosen()
	pass # Replace with function body.
