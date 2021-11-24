extends Node2D

var mirrorInteracted
var weaponEquiped
var haha = "hello"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	weaponEquiped = get_node("Area2D").get("weaponEquiped")
	mirrorInteracted = get_node("/root/Node2D/Mirror2").get("mirrorInteracted")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if mirrorInteracted == true:
		get_node("Area2D")._play()
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	get_node("Area2D")._play1()
	pass # Replace with function body.
