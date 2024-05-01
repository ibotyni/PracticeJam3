extends Enemy
class_name EnemyFast
# Enemy of type fast, faster movement and reload speed then default

func _ready():
	move_speed += 30

func _on_reload_timer_timeout():
	state = STATES.READY
