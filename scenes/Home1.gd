extends Node2D


var mirrorInteracted
var DoorInteracted = false
var weaponEquiped

# Called when the node enters the scene tree for the first time.
func _ready():
	$Mirror2/RichTextLabel.visible = false
	get_node("StaticBody2D").visible = true
	set_process_input(false)
	pass # Replace with function body.


func _process(delta):
	mirrorInteracted = get_node("Mirror2").get("mirrorInteracted")
	weaponEquiped = get_node("/root/Node2D/ItemWeapon").get("weaponEquiped")
#DOOR
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") && weaponEquiped == true:
		set_process_input(true)
		print("Body Entered Door")
	pass # Replace with function body.

#MIRROR
func _on_Area2D2_body_entered(body):
	if body.is_in_group("Player"):
		$Mirror2/RichTextLabel.visible = true
		.get_node("Mirror2")._play()
		print("Body Entered Mirror")
	pass # Replace with function body.

#MIRROR
func _on_Area2D2_body_exited(body):
	if body.is_in_group("Player"):
		$Mirror2/RichTextLabel.visible = false
		.get_node("Mirror2")._ready()
		print("Body Exited Mirror")
	pass # Replace with function body.
#DOOR
func _on_Area2D_body_exited(body):
	if body.is_in_group("Player") && weaponEquiped == true:
		set_process_input(false)
		print("Body Exited Door")
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_E):
		get_tree().change_scene("res://scenes/Streets.tscn")
