extends RichTextLabel


var dialogue = ["Ugh... Where am I...? What happened...?",
"I have to check the mirror",
"What is your name?",
"What happened...? Why can’t I seem to remember anything... I’ll have to figure this out.",
""]
var page = 0
var arraySize = dialogue.size() - 1
onready var inputName = get_node("/root/Name Selection/LineEdit")
onready var officialName = get_node("/root/Name Selection/DialogBox/Name")
var userName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	print(arraySize)
	set_process_input(false)
	pass # Replace with function body.

func _play():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)

func _physics_process(delta):
	if visible_characters > get_total_character_count() && page == 2	:
		inputName.visible = true
	else:
		inputName.visible = false
	print(arraySize)
	print(page)

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
					set_process_input(false)
					get_node("/root/Name Selection/DialogBox").visible = false

func _on_LineEdit_text_entered(text):
	userName = text
	print(text)
	if visible_characters > get_total_character_count():
		officialName.bbcode_text = text
		inputName.visible = false
		set_physics_process(false)
		set_visible_characters(0)
		print(page)
		set_bbcode(dialogue[page])
		set_bbcode("My name... my name... oh yeah... my name is " + "" + text)
		inputName.text = ""
		set_process_input(true)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.

