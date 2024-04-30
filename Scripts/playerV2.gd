extends CharacterBody2D
@export var speed = 100

func get_input():
	var input_direction = Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down")
	velocity = input_direction * speed

func _physics_process(delta):
#Initial Variant of Code, left for posterity.
	#var input_vector = Vector2.ZERO
	#input_vector.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	#input_vector.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	#print(input_vector)
	#nput_vector.normalized()
	#if input_vector:
	#	velocity = input_vector * speed
	#move_and_slide()
	get_input()
	move_and_slide()
