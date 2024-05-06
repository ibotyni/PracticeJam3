extends TextureProgressBar

@export var player: Player
@export var boss: EnemyBoss
# Called when the node enters the scene tree for the first time.
func _ready():
	if player != null:
		player.healthChanged.connect(updatePlayerHealth) # Replace with function body.
		updatePlayerHealth()
	elif boss != null:
		boss.healthChanged.connect(updateBossHealth) # Replace with function body.
		updateBossHealth()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func updatePlayerHealth():
	var player_vars = get_node("/root/PlayerVariables")
	if player_vars == null:
		return
	max_value = player_vars.level_health * 4
	value = player_vars.health

func updateBossHealth():
	var player_vars = get_node("/root/PlayerVariables")
	max_value = player_vars.level_health * 12
	if boss.health > max_value:
		boss.health = max_value
	value = boss.health

func _on_body_entered(body):
	pass # Replace with function body.
