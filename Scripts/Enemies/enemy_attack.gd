extends Enemy
class_name EnemyAttack
# Enemy of attack type, deals more damage then default

func _ready():
	damage += 10

func _on_reload_timer_timeout():
	state = STATES.READY
