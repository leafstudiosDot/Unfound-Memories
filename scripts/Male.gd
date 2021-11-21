extends RichTextLabel

export (Color,RGB) var mouse_over
export (Color,RGB) var mouse_out

onready var genderPicked = get_node("/root/Node2D/CanvasLayer")

func _ready():
	pass # Replace with function body.




func _on_Male_mouse_entered():
	set_modulate(mouse_over)
	pass # Replace with function body.


func _on_Male_mouse_exited():
	set_modulate(mouse_out)
	pass # Replace with function body.


func _on_Male_gui_input(event):
	if (event is InputEventMouseButton && event.pressed):
		genderPicked.genderChosen()
		print("Picked Male")
	pass # Replace with function body.
