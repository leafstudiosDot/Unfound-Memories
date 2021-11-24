extends Area2D


var mirrorInteracted = false


# Called when the node enters the scene tree for the first time.
func _ready():
	print('hallo')
	set_process_input(false)
	pass # Replace with function body.


func _play():
	set_process_input(true)
	pass

func _input(event):
	if Input.is_key_pressed(KEY_E):
		$RichTextLabel.visible = false
		print("key pressed")
		mirrorInteracted = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
