extends RichTextLabel


var dialogue = [
"You have obtained a Core Memory!",
"A Core Memory makes you remember a skill!",
"You can obtain a Core Memory by leveling up",
"You can level up by killing a specific amount of Enemies.",
"The skill you remember is called Sweeping Attack",
"Using Sweeping Attack you can attack 2 enemies at once!",
""
]
var page = 0
var arraySize = dialogue.size() - 1


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false)
	pass # Replace with function body.

func _play():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	get_node("/root/Node2D/Player").turnOffPlayer()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if visible_characters > get_total_character_count():
				set_visible_characters(0)
				print(page)
				page += 1
				set_bbcode(dialogue[page])
				if arraySize == page:
					print("max")
					set_process_input(false)
					get_node("/root/Node2D/Player").turnOnPlayer()
					get_node("/root/Node2D/Player/Name Selection/DialogBox/Text1")._play()
					get_node("/root/Node2D/Player/Name Selection/DialogBox").visible = true
					get_node("/root/Node2D/Player/TutorialMemoryCore").queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.
