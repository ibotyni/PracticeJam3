extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ready():
	scene_spawner()


func scene_spawner():
	print("scene_spawner")
	var player = get_node("GameManager/Player")
	var total_enemies = player.level_health + player.level_speed + player.level_strength
	var enemies = [ load("res://Scenes/Enemies/enemy_fast.tscn"), load("res://Scenes/Enemies/enemy_defence.tscn"), load("res://Scenes/Enemies/enemy_attack.tscn") ]
	
	for i in range(total_enemies):
		var enemy = enemies[randi_range(0,2)].instantiate()
		enemy.position = Vector2( randi_range(20, 400), randi_range(20, 400) )
		enemy.add_to_group("enemy")
		enemy.target = get_node("GameManager/Player")
		
		# add the shot to the root scene so translation is in world space
		add_child(enemy)
