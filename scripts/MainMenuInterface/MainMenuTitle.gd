extends RichTextLabel
var dialog = ["Unfound Memories"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	
	
	pass 
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	
	pass # Replace with function body.
