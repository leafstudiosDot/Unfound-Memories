extends RichTextLabel


var dialogue = ["Honeyy? What would you like for breakfast? Toast? Bacon? Or do you want me to pour in the whole nine yards?",
"Oh you want it all? Of course, anything for you honey~",
"...",
""
]
var page = 0
var arraySize = dialogue.size() - 1
var dialogueFinished = false
onready var endOfLines = get_node("/root/Node2D/CanvasLayer/Dialoguebox")


# Called when the node enters the scene tree for the first time.
func _ready():

	set_process_input(false)
	print(arraySize)
	pass # Replace with function body.

func _play():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton or InputEventKey:
		if event.is_pressed():
			if visible_characters > get_total_character_count():
				set_visible_characters(0)
				print(page)
				page += 1
				set_bbcode(dialogue[page])
				if arraySize == page:
					print("max")
					endOfLines.visible = false
					set_process_input(false)
					dialogueFinished = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.
