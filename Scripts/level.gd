extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ready():
	pass


func scene_spawner():
	print("scene_spawner")
	var scene = get_node("/root/Level")
	var player = get_node("/root/Level/GameManager/Player")
	var player_vars = get_node("/root/PlayerVariables")
	var total_enemies = player_vars.level_health + player_vars.level_speed + player_vars.level_strength
	
	var enemies = [ load("res://Scenes/Enemies/enemy_fast.tscn"), load("res://Scenes/Enemies/enemy_defence.tscn"), load("res://Scenes/Enemies/enemy_attack.tscn") ]
	
	for i in range(total_enemies):
		var enemy = enemies[randi_range(0,2)].instantiate()
		var p = Vector2( randi_range(20, 400), randi_range(20, 400) )
		enemy.position = p
		while (enemy.position.x > 100 and enemy.position.x < 300) and (enemy.position.y > 100 and enemy.position.y < 300):
			p = Vector2( randi_range(20, 400), randi_range(20, 400) )
			enemy.position = p
		enemy.add_to_group("enemy")
		enemy.target = player
		
		# add the shot to the root scene so translation is in world space
		scene.add_child(enemy)


func _on_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://Scenes/Levels/ChoosePath.tscn")



func _on_timer_timeout():
	scene_spawner()

