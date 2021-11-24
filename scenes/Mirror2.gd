extends Area2D


var mirrorInteracted = false
onready var dialogue = get_node("/root/Node2D/Player/Name Selection")

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
		dialogue._play()
		print("key pressed")
		mirrorInteracted = true
		set_process_input(false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
