extends Control

func _on_button_retry_pressed():
	var level = "res://Scenes/Levels/level{level}.tscn".format({"level": randi_range(1,12)})
	var player_vars = get_node("/root/PlayerVariables")
	player_vars.level_health = 1
	player_vars.level_speed = 1
	player_vars.level_strength = 1
	player_vars.health = 4
	get_tree().change_scene_to_file(level)

func _on_button_main_menu_pressed():
	var player_vars = get_node("/root/PlayerVariables")
	player_vars.level_health = 1
	player_vars.level_speed = 1
	player_vars.level_strength = 1
	player_vars.health = 4
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
