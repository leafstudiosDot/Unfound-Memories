extends NinePatchRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.

func _play():
	visible = true
	get_node("Text")._play()
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	_play()
	pass # Replace with function body.