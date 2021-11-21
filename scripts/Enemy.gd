extends KinematicBody2D


var player = null
var move = Vector2.ZERO
var speed = 2
var healthPoints = 100


# Called when the node enters the scene tree for the first time.
func _ready():
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
