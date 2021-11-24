extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dialog = ["Good Morning!","kill me pls","daddy uwu",]
var nice = ["Aww thats so kind of you! (+Karma Points)"]
var rude = ["hey im talking to you!(-Karma points)","Now thats just rude! (-Karma Points)"]
var page = 0
var arraySize = dialog.size()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _play():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	pass 

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			set_visible_characters(0)
			page += 1
			set_bbcode(dialog[page])
			if arraySize == page:
				print("yeah")
				set_process_input(false)
