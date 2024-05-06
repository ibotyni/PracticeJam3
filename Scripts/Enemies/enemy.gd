extends CharacterBody2D
class_name Enemy
# Base class for all enemies

enum TYPE { FAST, ATTACK, DEFENCE }
enum STATES { READY, FIRING, RELOADING }

signal levelComplete

@export var target: Player
@export var SHOT_SCENE: PackedScene
@export var damage := 5

@onready var reload_timer = $ReloadTimer
@onready var sprite: Sprite2D = $Sprite2D
@onready var feet_hitbox: Area2D = $FeetHitbox
@onready var invul_timer = $InvulnerabilityTimer



var state := STATES.READY
@export var move_speed = 15
@export var health := 50:
	set(val):
		if val <= 0:
			death()
		health = val
		print("enemy health: ", health)

@onready var nav: NavigationAgent2D = $NavigationAgent2D

var is_invul := false
var nav_loaded: bool = false

func _ready():
	call_deferred("actor_setup")

func _physics_process(delta):
	if !nav_loaded:
		nav_loaded = true
		return

	if target:
		move_towards_target(delta)
		shoot_player(delta)
		move_and_slide()

func move_towards_target(delta) -> void:
	if !nav_loaded:
		nav_loaded = true
		return
			
	if(!target):
		return
	var distance_to_player := position.distance_to(target.position)
	var direction_to_player := position.direction_to(target.position)
	
	# tries to keep distance from the player
	if distance_to_player > 100.0:
		nav.target_position = target.position
	elif distance_to_player < 60:
		nav.target_position = position - direction_to_player
	else:
		velocity = Vector2.ZERO
		return
	
	
	var next_path_pos: Vector2 = nav.get_next_path_position()
	velocity = global_position.direction_to(next_path_pos) * move_speed

func shoot_player(delta) -> void:
	if state != STATES.READY:
		return
	
	if(!target):
		return
		
	state = STATES.FIRING
	# create a shot at our position and set it's direction
	var shot = SHOT_SCENE.instantiate()
	shot.direction = (target.position - position).normalized()
	shot.global_position = global_position
	shot.look_at(target.position)
	shot.damage = damage
	# add the shot to the root scene so translation is in world space
	get_tree().root.add_child(shot)
	
	# set state to reload and start timer 
	state = STATES.RELOADING
	reload_timer.start()



func death() -> void:
	if get_tree().get_nodes_in_group("enemy").size() == 1:
		print("level complete")
		get_tree().change_scene_to_file("res://Scenes/Levels/ChoosePath.tscn")
	queue_free()

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	if !target:
		nav.target_position = Vector2.ZERO
	else:
		nav.target_position = target.position

# sets health and makes sprite blink red and invulnerable
func take_damage(dmg) -> void:
	if !is_invul:
		health -= dmg
		sprite.modulate = Color.RED
		is_invul = true
		feet_hitbox.set_deferred("monitorable", false)
		invul_timer.start()

func end_invulnerable() -> void:
	sprite.modulate = Color.WHITE
	is_invul = false
	feet_hitbox.monitorable = true

func _on_reload_timer_timeout():
	state = STATES.READY
