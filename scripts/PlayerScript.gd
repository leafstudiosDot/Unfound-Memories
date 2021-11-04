extends KinematicBody2D

# Main Status
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

func _physics_process(delta):
	loc_coord = Vector2()
	
	# Inputs and Actions
	if Input.is_action_pressed("playermove_up"):
		loc_coord.y -= moveSpeed + speedBonus
	
	if Input.is_action_pressed("playermove_down"):
		loc_coord.y += moveSpeed + speedBonus
		
	if Input.is_action_pressed("playermove_left"):
		loc_coord.x -= moveSpeed + speedBonus
		facing = Vector2(-1, 0)
		
	if Input.is_action_pressed("playermove_right"):
		loc_coord.x += moveSpeed + speedBonus
		facing = Vector2(1, 0)
		
	if Input.is_action_pressed("sprint"):
		speedBonus = 15
	else:
		speedBonus = 0
	
	loc_coord.normalized()
	
	move_and_slide(loc_coord * moveSpeed)
