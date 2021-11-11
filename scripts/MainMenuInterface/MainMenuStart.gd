extends RichTextLabel


export (Color,RGB) var mouse_over
export (Color,RGB) var mouse_out


func _ready():
	pass # Replace with function body.


func _on_Start_mouse_entered():
	set_modulate(mouse_over)
	get_parent().get_node("../CanvasLayer/pointer")._play()
	pass # Replace with function body.


func _on_Start_mouse_exited():
	set_modulate(mouse_out)
	get_parent().get_node("../CanvasLayer/pointer")._ready()
	pass # Replace with function body.
