extends CharacterBody2D
class_name Player

var direction : Vector2 = Vector2.ZERO
var swing : bool = false
var is_invulnerable: bool = false

var last_direction = "Down"
@export var Bullet : PackedScene
@onready var invul_timer = $InvulnerabilityTimer
@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var feet_hitbox: Area2D = $FeetHitbox

var health := 100:
	set(new_health):
		# Temporary setter function for debugging
		if !is_invulnerable:
			health = new_health
			make_invulnerable()
			print("player health: ", health)

# Turns off player hitbox and makes him red
func make_invulnerable() -> void:
	is_invulnerable = true
	feet_hitbox.monitorable = false
	player_sprite.modulate = Color.RED
	invul_timer.start()

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
	
	if Input.is_action_just_pressed("swing"):
		set_swing(true)
		
	if Input.is_action_just_pressed("Primary_Attack"):
		shoot()
			
func set_swing(value = false):
	swing = value
	#animation_tree["parameters/conditions/swing"] = value

func shoot():
	var bullet = Bullet.instantiate()
	owner.add_child(bullet)
	bullet.transform = $ReticleHolder/Sprite2D/Aim.global_transform

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

func die() -> void:
	print("game over")

func _on_invulnerability_timer_timeout():
	is_invulnerable = false
	player_sprite.modulate = Color.WHITE
	feet_hitbox.monitorable = true
	
