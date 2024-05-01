extends CharacterBody2D
class_name Player

var direction : Vector2 = Vector2.ZERO
var swing : bool = false

var last_direction = "Down"
@export var Bullet : PackedScene

func _ready():
	var tilemap_rect = get_parent().get_parent().get_node("TileMap2").get_used_rect()
	var tilemap_cell_size = get_parent().get_parent().get_node("TileMap2").tile_set.tile_size
	$Camera2D.limit_left = tilemap_rect.position.x * tilemap_cell_size.x
	$Camera2D.limit_right = tilemap_rect.end.x * tilemap_cell_size.x
	$Camera2D.limit_left = tilemap_rect.position.y * tilemap_cell_size.y
	$Camera2D.limit_right = tilemap_rect.end.y * tilemap_cell_size.y

# TODO: Player Spawn Position: Currently not working.

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
	
	#if Input.is_action_just_pressed("swing"):
		#set_swing(true)
		
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


