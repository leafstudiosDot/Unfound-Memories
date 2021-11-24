extends RichTextLabel


var dialogue = [
"Ugh... Where am I...? What happened...?", #Player Dialogue Array = 0
"I have to check the mirror to see myself",
"Who am I?",
"Wait I think I can remember my name...",
"I think its",
"What happened...? Why can’t I seem to remember anything...",
"I managed to remember my name by just looking at myself...",
"I’ll have to figure this out.",
"I saw a Sword earlier... Lets pick it up!",
"Since I forgot what is outside,",
"I will use this just in case...",
""
]

var page = 0
var arraySize = dialogue.size() - 1
onready var inputName = get_node("/root/Node2D/Player/Name Selection/DialogBox/LineEdit")
onready var officialName = get_node("/root/Node2D/Player/Name Selection/DialogBox/Name")
onready var player = get_node("/root/Node2D/Player")
var userName = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(false)
	pass # Replace with function body.

func _play():
	set_process_input(true)
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	print("Dialogue Played")
	pass

func _physics_process(delta):
	
	
	if visible_characters > get_total_character_count() && page == 4:
		set_process_input(false)
		inputName.visible = true
	else:
		inputName.visible = false
	print(arraySize)
	print(page)

func _input(event):
	if event is InputEventMouseButton or InputEventKey:
		if event.is_pressed():
			if visible_characters > get_total_character_count():
				if page == 1:
					get_node("/root/Node2D/Player/Name Selection/DialogBox").visible = false
					set_process_input(false)
					player.set_physics_process(true)
				set_visible_characters(0)
				print(page)
				page += 1
				set_bbcode(dialogue[page])
				
				if page == 9:
					set_process_input(false)
					get_node("/root/Node2D/Player/Name Selection/DialogBox").visible = false
					player.set_physics_process(true)
				
				if page == 11:
					set_process_input(false)
					get_node("/root/Node2D/Player/Name Selection/DialogBox").visible = false
					player.set_physics_process(true)
				
				if arraySize == page:
					print("max")
					set_process_input(false)
					get_node("/root/Node2D/Player/Name Selection/DialogBox").visible = false
					player.set_physics_process(true)

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

