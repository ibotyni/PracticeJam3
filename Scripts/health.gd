extends TextureProgressBar

@export var player: Player
@export var boss: EnemyBoss
# Called when the node enters the scene tree for the first time.
func _ready():
	if(boss==null):
		player.healthChanged.connect(updatePlayerHealth) # Replace with function body.
		updatePlayerHealth()
	elif(player == null):
		boss.healthChanged.connect(updateBossHealth) # Replace with function body.
		updateBossHealth()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func updatePlayerHealth():
	value = player.health
	
func updateBossHealth():
	value = boss.health
	

