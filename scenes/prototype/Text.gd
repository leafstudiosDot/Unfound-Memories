extends RichTextLabel


var dialogue = ["Honeyy? What would you like for breakfast? Toast? Bacon? Or do you want me to pour in the whole nine yards?",
"Oh you want it all? Of course, anything for you honey~",
"..."]
var page = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if visible_characters > get_total_character_count():
				set_visible_characters(0)
				page += 1
				set_bbcode(dialogue[page])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.
