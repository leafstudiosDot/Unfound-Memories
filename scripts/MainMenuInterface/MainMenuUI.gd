extends Control

onready var AnimationSet = get_node("AnimationSet")

func _ready():
	AnimationSet.play("FadeOut")
