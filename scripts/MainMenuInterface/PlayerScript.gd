extends KinematicBody2D

# Main Status
var online = false
var female = false
var flipped = false
var level : int = 1
var levelxp : int = 0 # (Level Int * 16 = levelxp)
var karma : float = 0.0
var moveSpeed : int = 7
var speedBonus : int = 0
# Currency £
var money : float = 20.0
var bank : float = 512.0

# Play Time
var playTime : float = 0.0 # Hours.Minutes
var playTimeSeconds : int = 0.0 # Seconds
# This will delete your save if modified and its based on the levelxp


# Player Status
var personality : String = "Normal" # Permanent Option at Save
var esteem : float = 0.0 # Confidential
# Game
var loc_coord : Vector2 = Vector2()
var facing : Vector2 = Vector2() # Left and Right

onready var rayCast = get_node("RayCast2D")
onready var playerNameLabel = get_node("Player_Name")
onready var swordAnimationRight = get_node("SwordSwingingRight")
onready var swordAnimationLeft = get_node("SwordSwingingLeft")
onready var swordAnimationRight_F = get_node("SwordSwingingRight_F")
onready var swordAnimationLeft_F = get_node("SwordSwingingLeft_F")
onready var spriteMale = get_node("Sprite_Male")
onready var spriteFemale = get_node("Sprite_Male")

func _ready():
	swordAnimationRight.visible = false
	swordAnimationLeft.visible = false
	swordAnimationRight_F.visible = false
	swordAnimationLeft_F.visible = false
	$AnimationPlayer.play("idle_right")
	$AttackHitboxRight/CollisionShape2D.disabled = true
	$AttackHitboxLeft/CollisionShape2D.disabled = true
	if female:
		get_node( "Sprite_Male" ).visible = false
		get_node( "Sprite_Female" ).visible = true
	else:
		get_node( "Sprite_Male" ).visible = true
		get_node( "Sprite_Female" ).visible = false
	
	if online:
		playerNameLabel.show()
	else:
		playerNameLabel.hide()

func _physics_process(delta):
	loc_coord = Vector2()
	get_node( "Sprite_Male" ).set_flip_h( flipped )
	get_node( "Sprite_Female" ).set_flip_h( flipped )
	
	# Inputs and Actions
	if Input.is_action_pressed("playermove_up"):
		$AnimationPlayer.play("walk_right")
		loc_coord.y -= moveSpeed + speedBonus
	elif Input.is_action_just_released("playermove_up"):
		$AnimationPlayer.play("idle_right")
	
	if Input.is_action_pressed("playermove_down"):
		$AnimationPlayer.play("walk_right")
		loc_coord.y += moveSpeed + speedBonus
	elif Input.is_action_just_released("playermove_down"):
		$AnimationPlayer.play("idle_right")
		
	if Input.is_action_pressed("playermove_left"):
		flipped = true
		$AnimationPlayer.play("walk_right")
		loc_coord.x -= moveSpeed + speedBonus
		facing = Vector2(-1, 0)
	elif Input.is_action_just_released("playermove_left"):
		$AnimationPlayer.play("idle_right")
		
	if Input.is_action_pressed("playermove_right"):
		flipped = false
		$AnimationPlayer.play("walk_right")
		loc_coord.x += moveSpeed + speedBonus
		facing = Vector2(1, 0)
	elif Input.is_action_just_released("playermove_right"):
		$AnimationPlayer.play("idle_right")
		
	if Input.is_action_pressed("sprint"):
		speedBonus = 15
	else:
		speedBonus = 0
	
	if Input.is_key_pressed(KEY_X) && flipped == false && get_node("/root/Node2D/ItemWeapon").get("weaponEquiped"):
		if female:
			get_node( "Sprite_Female" ).visible = false
		else:
			spriteMale.visible = false
		set_physics_process(false)
		if female:
			swordAnimationRight_F.visible = true
		else:
			swordAnimationRight.visible = true
		$AttackHitboxRight/CollisionShape2D.disabled = false
		$AnimationPlayer.play("Attack")
	
	if Input.is_key_pressed(KEY_X) && flipped == true && get_node("/root/Node2D/ItemWeapon").get("weaponEquiped"):
		if female:
			get_node( "Sprite_Female" ).visible = false
		else:
			spriteMale.visible = false
		set_physics_process(false)
		if female:
			swordAnimationLeft_F.visible = true
		else:
			swordAnimationLeft.visible = true
		$AnimationPlayer.play("Attack")
		$AttackHitboxLeft/CollisionShape2D.disabled = false
	loc_coord.normalized()
	
	move_and_slide(loc_coord * moveSpeed)


func _on_AnimationPlayer_animation_finished(Attack):
	if female:
		get_node( "Sprite_Female" ).visible = true
		spriteMale.visible = false
	else:
		spriteMale.visible = true
		get_node( "Sprite_Female" ).visible = false
	
	swordAnimationLeft.visible = false
	swordAnimationRight.visible = false
	swordAnimationLeft_F.visible = false
	swordAnimationRight_F.visible = false
	$AttackHitboxLeft/CollisionShape2D.disabled = true
	$AttackHitboxRight/CollisionShape2D.disabled = true
	visible = true
	set_physics_process(true)
	pass # Replace with function body.
