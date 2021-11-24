extends KinematicBody2D

var player = null
var move = Vector2.ZERO
var speed = 0.5
var healthPoints = 100
var Dead = false
onready var healthLabel = get_node("RichTextLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	healthLabel.bbcode_text = "Health: " + str(healthPoints)
	pass # Replace with function body.

func _physics_process(delta):
	if player != null:
		move = position.direction_to(player.position) * speed
	else:
		move = Vector2.ZERO
	
	move = move.normalized()
	move = move_and_collide(move)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.is_in_group("Player"):
		if body != self:
			player = body
	pass # Replace with function body.


func _on_Area2D_body_shape_exited(body_id, body, body_shape, local_shape):
	player = null
	pass # Replace with function body.




func _on_Area2D2_body_entered(body):
	if body != self:
		print("player touch enemy")
	pass # Replace with function body.


func _on_HitBox_area_entered(area):
	if area.is_in_group("Sword"):
		modulate = Color(1,0,0)
		healthPoints -= 20
		healthLabel.bbcode_text = "Health: " + str(healthPoints)
		print("Enemy HP: " + str(healthPoints))
		$HurtSound.play()
		if healthPoints <= 0:
			print("Enemy Dead")
			Dead = true
			queue_free()
	pass # Replace with function body.


func _on_HitBox_area_exited(area):
	if area.is_in_group("Sword"):
		modulate = Color(1,1,1)
	pass # Replace with function body.
