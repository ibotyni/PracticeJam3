extends Enemy
class_name EnemyDefence
# Enemy of type defence, has more health then default

func _ready():
	health += 50

func _on_reload_timer_timeout():
	state = STATES.READY
