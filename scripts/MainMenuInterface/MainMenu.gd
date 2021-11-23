extends Node2D

onready var ParticlesGroup = get_node("Particles")

func _ready():
	ParticlesGroup.show()
