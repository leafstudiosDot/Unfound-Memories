extends Node2D


var inMirror = false
var inDoor = false
var weaponEquiped

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("StaticBody2D").visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#DOOR
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Body Entered Door")
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"):
		print("Body Entered Door")
	pass # Replace with function body.

#MIRROR
func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"):
		print("Body Exited Mirror")
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		print("Body Exited Mirror")
	pass # Replace with function body.
