extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var inputName = get_node("DialogBox/LineEdit")
onready var outputText = get_node("DialogBox/Text1")
onready var player = get_node("/root/Node2D/Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	$DialogBox.visible = false
	pass # Replace with function body.

func _play():
	$DialogBox.visible = true
	$DialogBox/Text1._play()
	player.turnOffPlayer()
	pass
 # Replace with function body.

func _physics_process(delta):
	var userName = get_node("DialogBox/Text1").get("userName")



func _on_Timer_timeout():
	pass # Replace with function body.
