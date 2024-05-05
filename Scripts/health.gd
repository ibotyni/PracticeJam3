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
	max_value = player.level_health * 4
	value = player.health
	
func updateBossHealth():
	max_value = player.level_health * 12
	if boss.health > max_value:
		boss.health = max_value
	value = boss.health
	

