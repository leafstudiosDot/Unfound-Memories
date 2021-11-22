extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var inputName = get_node("LineEdit")
onready var outputText = get_node("Text1")


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

 # Replace with function body.

func _physics_process(delta):
	var userName = get_node("DialogBox/Text1").get("userName")



func _on_Timer_timeout():
	pass # Replace with function body.
