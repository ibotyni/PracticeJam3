extends TextureProgressBar

@export var player: Player
# Called when the node enters the scene tree for the first time.
func _ready():
	player.healthChanged.connect(update) # Replace with function body.
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update():
	value = player.health
	

