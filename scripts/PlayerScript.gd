extends KinematicBody2D

# Main Status
var level : int = 1
var levelxp : int = 0 # (Level Int * 16 = levelxp)
var karma : float = 0.0

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
