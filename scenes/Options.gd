extends RichTextLabel


export (Color,RGB) var mouse_over
export (Color,RGB) var mouse_out


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Options_mouse_entered():
	set_modulate(mouse_over)
	get_parent().get_node("CanvasLayer/pointer2")._play()
	pass # Replace with function body.


func _on_Options_mouse_exited():
	set_modulate(mouse_out)
	get_parent().get_node("CanvasLayer/pointer2")._ready()
	pass # Replace with function body.
