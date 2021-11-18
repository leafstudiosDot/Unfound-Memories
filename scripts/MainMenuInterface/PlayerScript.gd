extends KinematicBody2D

# Main Status
var online = false
var female = false
var flipped = false
var level : int = 1
var levelxp : int = 0 # (Level Int * 16 = levelxp)
var karma : float = 0.0
var moveSpeed : int = 15
var speedBonus : int = 0

# Currency £
var money : float = 20.0
var bank : float = 512.0

# Play Time
var playTime : float = 0.0 # Hours.Minutes
var playTimeSeconds : int = 0.0 # Seconds
# This will delete your save if modified and its based on the levelxp


# Player Status
var gender : String = "Male" # Gender, [ Male, Female ]
var personality : String = "Normal" # Permanent Option at Save
var esteem : float = 0.0 # Confidential

# Game
var loc_coord : Vector2 = Vector2()
var facing : Vector2 = Vector2() # Left and Right

onready var rayCast = get_node("RayCast2D")
onready var playerNameLabel = get_node("Player_Name")

func _ready():
	$AnimationPlayer.play("idle_right")
	
	if online:
		playerNameLabel.show()
	else:
		playerNameLabel.hide()

func _physics_process(delta):
	loc_coord = Vector2()
	
	get_node( "Sprite_Male" ).set_flip_h( flipped )
	
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
	
	loc_coord.normalized()
	
	move_and_slide(loc_coord * moveSpeed)
