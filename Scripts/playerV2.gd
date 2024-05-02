extends CharacterBody2D
class_name Player

enum STATES { READY, FIRING, RELOADING }
var is_invulnerable: bool = false

@export var Bullet : PackedScene
@onready var invul_timer = $InvulnerabilityTimer
@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var feet_hitbox: Area2D = $FeetHitbox
@export var health := 100:
	set(new_health):
		if new_health <= 0:
			death()
		# Temporary setter function for debugging
		if !is_invulnerable:
			health = new_health
			make_invulnerable()
			print("player health: ", health)
		
@onready var reload_timer = $ReloadTimer

var direction : Vector2 = Vector2.ZERO
var swing : bool = false
var last_direction = "Down"
var state = STATES.READY

func _ready():
	var tilemap_rect = get_parent().get_parent().get_node("TileMap2").get_used_rect()
	var tilemap_cell_size = get_parent().get_parent().get_node("TileMap2").tile_set.tile_size
	$Camera2D.limit_left = tilemap_rect.position.x * tilemap_cell_size.x
	$Camera2D.limit_right = tilemap_rect.end.x * tilemap_cell_size.x
	$Camera2D.limit_left = tilemap_rect.position.y * tilemap_cell_size.y
	$Camera2D.limit_right = tilemap_rect.end.y * tilemap_cell_size.y

# TODO: Player Spawn Position: Currently not working.
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
		
	if Input.is_action_pressed("Primary_Attack"):
		shoot()
			
func set_swing(value = false):
	swing = value
	#animation_tree["parameters/conditions/swing"] = value
	
func death() -> void:
	queue_free()

func shoot():
	if state != STATES.READY:
		return
	state = STATES.FIRING
	var bullet = Bullet.instantiate()
	owner.add_child(bullet)
	bullet.transform = $ReticleHolder/Sprite2D/Aim.global_transform
	
	reload_timer.start()
	state = STATES.RELOADING
	

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

func _on_reload_timer_timeout():
	state = STATES.READY

func _on_invulnerability_timer_timeout():
	is_invulnerable = false
	player_sprite.modulate = Color.WHITE
	feet_hitbox.monitorable = true
	
