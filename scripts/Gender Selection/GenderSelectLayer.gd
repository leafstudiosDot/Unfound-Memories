extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var FadeOutAfter = get_node("ColorRect2")

# Called when the node enters the scene tree for the first time.
func _ready():
	FadeOutAfter.visible = false
	text_fade_in()
	pass # Replace with function body.

func text_fade_in():
	$AnimationPlayer.play("Fade_In")
	
func GenderChosen():
	FadeOutAfter.visible = true
	$AnimationPlayer.play("GenderChosen")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
