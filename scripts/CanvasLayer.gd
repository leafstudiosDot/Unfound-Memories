extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var FadeOutAfter = get_node("ColorRect2")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Fade in")
	pass # Replace with function body.

func genderChosen():
	FadeOutAfter.visible = true
	print("gender chosen")
	$AnimationPlayer.play("Text Fade Out")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
