extends CharacterBody2D
class_name Enemy
# Base class for all enemies

const SPEED := 25.0

enum STATES { READY, FIRING, RELOADING }

@export var target: Player = null
@export var SHOT_SCENE: PackedScene
@onready var reload_timer = $ReloadTimer

var state := STATES.READY
var move_speed := SPEED
var health := 50:
	set(val):
		if val <= 0:
			death()
		health = val
var damage := 5

func _physics_process(delta):
	if target:
		move_towards_target(delta)
		shoot_player(delta)
		move_and_slide()

func move_towards_target(delta) -> void:
	var move_direction = Vector2.ZERO
	var distance_to_player := position.distance_to(target.position)
	
	# tries to keep distance from the player
	if distance_to_player > 100.0:
		move_direction = (target.position - position).normalized()
	elif distance_to_player < 60:
		move_direction = (position - target.position).normalized()
	else:
		move_direction = Vector2.ZERO
	
	velocity = velocity.move_toward(move_direction * move_speed, 100 * delta)
			

func shoot_player(delta) -> void:
	if state != STATES.READY:
		return
	
	state = STATES.FIRING
	# create a shot at our position and set it's direction
	var shot = SHOT_SCENE.instantiate()
	shot.direction = (target.position - position).normalized()
	shot.global_position = global_position
	shot.damage = damage
	# add the shot to the root scene so translation is in world space
	get_tree().root.add_child(shot)
	
	# set state to reload and start timer 
	state = STATES.RELOADING
	reload_timer.start()

func death() -> void:
	queue_free()
