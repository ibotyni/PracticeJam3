extends CharacterBody2D
class_name EnemyBoss

enum STATES { READY, FIRING, RELOADING, SPECIAL }

@onready var anim_tree: AnimationTree = $AnimatedSprite2D/AnimationTree
@onready var navigation: NavigationAgent2D = $NavigationAgent2D
@onready var left_hand: Marker2D = %LeftHand
@onready var right_hand: Marker2D = %RightHand
@onready var reload_timer = $ReloadTimer
@onready var anim_player: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer
@onready var head: Marker2D = %Head
@onready var laser_scene = $Head/BossLaser

@export var BULLET_SCENE: PackedScene
@export var target: Player
@export var damage := 10 #damage for the bullets, for laser dmg check laser scene
@export var health := 1000:
	set(val):
		if val <= 0:
			death()
		health = val
		print("boss health: ", health)

const SPEED := 50.0

var state := STATES.READY

func _ready():
	anim_tree.set("parameters/conditions/is_idle", true)
	call_deferred("actor_setup")

func _process(delta):
	point_laser()
	move_towards_target(delta)
	shoot_player()
	move_and_slide()

func move_towards_target(delta) -> void:
	if(!target):
		return
	var distance_to_player := position.distance_to(target.position)
	var direction_to_player := position.direction_to(target.position)
	
	# tries to keep distance from the player
	if distance_to_player > 100.0:
		anim_tree.set("parameters/conditions/is_moving", true)
		anim_tree.set("parameters/conditions/is_idle", false)
		navigation.target_position = target.position
	elif distance_to_player < 60:
		anim_tree.set("parameters/conditions/is_moving", true)
		anim_tree.set("parameters/conditions/is_idle", false)
		navigation.target_position = position - direction_to_player
	else:
		velocity = Vector2.ZERO
		anim_tree.set("parameters/conditions/is_moving", false)
		anim_tree.set("parameters/conditions/is_idle", true)
		return
	
	# if boss is firing special, stop moving
	if state == STATES.SPECIAL:
		velocity = Vector2.ZERO
		return
	
	var next_path_pos: Vector2 = navigation.get_next_path_position()
	velocity = global_position.direction_to(next_path_pos) * SPEED

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	if !target:
		navigation.target_position = Vector2.ZERO
	else:
		navigation.target_position = target.position

func shoot_player() -> void:
	if !target:
		return
	
	if state != STATES.READY:
		return
	
	state = STATES.FIRING
	
	# one bullet for each hand
	var bullet_r = BULLET_SCENE.instantiate()
	var bullet_r2 = BULLET_SCENE.instantiate()
	var bullet_l = BULLET_SCENE.instantiate()
	
	var bdirection = position.direction_to(target.position)
	
	bullet_r.direction = bdirection
	bullet_r.global_position = right_hand.global_position
	bullet_r.damage = damage
	
	bullet_r2.direction = bdirection
	bullet_r2.global_position = right_hand.global_position
	bullet_r2.damage = damage
	
	bullet_l.direction = bdirection
	bullet_l.global_position = left_hand.global_position
	bullet_l.damage = damage
	
	# add the bullets to the root scene so translation is in world space
	get_tree().root.add_child(bullet_r)
	await get_tree().create_timer(.2).timeout
	get_tree().root.add_child(bullet_l)
	await get_tree().create_timer(.2).timeout
	get_tree().root.add_child(bullet_r2)
		
	
	# set state to reload and start timer 
	state = STATES.RELOADING
	reload_timer.start()

func shoot_laser() -> void:
	if !target:
		return
	
	state = STATES.SPECIAL
	anim_tree.set("parameters/conditions/shoot_laser", true)
	laser_scene.shoot()
	anim_tree.animation_finished.connect(stop_laser)

func stop_laser(anim_name) -> void:
	if anim_name == "shoot_laser":
		anim_tree.set("parameters/conditions/shoot_laser", false)
		state = STATES.READY
	
func _on_reload_timer_timeout():
	if state != STATES.SPECIAL:
		state = STATES.READY

func point_laser() -> void:
	if state != STATES.SPECIAL:
		head.look_at(target.position)
		
func take_damage(dmg) -> void:
		health -= dmg
		
func death() -> void:
	queue_free()
