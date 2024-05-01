extends CharacterBody2D
class_name Player

var direction : Vector2 = Vector2.ZERO
var swing : bool = false

var last_direction = "Down"
@export var Bullet : PackedScene

var health := 100:
	set(new_health):
		health = new_health
		# Temporary setter function for debugging
		print("player health: ", health)


func _physics_process(_delta):
	if not swing:
		velocity = direction * 75
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _process(_delta):
	direction = Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down")
	
	if direction != Vector2.ZERO and not swing:
		set_walking(direction)
		#update_blend_position()
	else:
		set_walking(Vector2.ZERO)
	



func set_walking(value):
	if value[1] == -1: # 0,-1
		last_direction = "Up"
	if value[1] == 1: # 0,1
		last_direction = "Down"
	if value[0] == -1: # -1,0
		last_direction = "Left"
	if value[0] == 1: # 1,0
		last_direction = "Right"

	if value == Vector2.ZERO:
		$AnimatedSprite2D.play("Idle_" + last_direction)
	else:
		$AnimatedSprite2D.play("Walk_" + last_direction)
	

#func update_blend_position():
	#animation_tree["parameters/attack/blend_position"] = direction
	#animation_tree["parameters/idle/blend_position"] = direction
	#animation_tree["parameters/walk/blend_position"] = direction
