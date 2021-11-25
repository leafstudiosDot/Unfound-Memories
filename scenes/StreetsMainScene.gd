extends Node2D


onready var player = get_node("/root/Node2D/Player")
onready var dialogueBox = get_node("Player/Name Selection")
onready var itemWeapon = get_node("ItemWeapon")
onready var dialoguePage = get_node("Player/Name Selection/DialogBox/Text1")
onready var ZombieAnim = get_node("AnimationPlayer2")

onready var Dead = false

func _ready():
	get_node("Player/TutorialMemoryCore").visible = false
	itemWeapon.physicsProcessOff()
	$AnimationPlayer.play("Fade_In")
	dialoguePage.makePage12()
	$ItemWeapon/Area2D._weaponEquiped()
	pass # Replace with function body.

func _physics_process(delta):
	Dead = get_node("Enemy3").get("Dead")
	ZombieAnim.play("Zombie walks")
	if Dead == true:
		get_node("Player/TutorialMemoryCore").visible = true
		get_node("Player/TutorialMemoryCore/Text")._play()
		physicsProcessFalse()
	pass

func physicsProcessFalse():
	set_physics_process(false)

func _on_AnimationPlayer_animation_finished(Fade_In):
	dialogueBox._play()
	pass # Replace with function body.
