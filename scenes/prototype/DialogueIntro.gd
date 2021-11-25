extends Node2D


var dialogueFinished


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/AnimationPlayer.play("Fade in")
	pass # Replace with function body.

func _process(delta):
	dialogueFinished = get_node("CanvasLayer/Dialoguebox/Text").get("dialogueFinished")
	if dialogueFinished == true:
		$AnimationPlayer1.play("Fade_Out")
		set_process(false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer1_animation_finished(Fade_Out):
	get_tree().change_scene("res://scenes/Home1.tscn")
	pass # Replace with function body.
