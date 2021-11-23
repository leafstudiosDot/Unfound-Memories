extends Node2D


var weaponEquiped
var haha = "hello"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	weaponEquiped = get_node("Area2D").get("weaponEquiped")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
