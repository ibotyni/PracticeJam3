
extends CharacterBody2D
var  SPEED = 100.0

func _physics_process(delta):
#Handles movement Left (-X) or Right (X)
	var directionX = Input.get_axis("Move_Left", "Move_Right")
#Handles Movement Down (-Y) or Up (+Y)
	var directionY = Input.get_axis("Move_Up", "Move_Down",)

#Apply Movement?
	if directionX:
		velocity.x = directionX * SPEED

	if directionY:
		velocity.y = directionY * SPEED
	move_and_slide()

