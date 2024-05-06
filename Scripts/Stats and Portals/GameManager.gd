extends Node
class_name GameManager

var player
var player_script 
var end_of_level : bool = false

func _ready():
	# Find the player and portals (Must be children of the GameManager).
	player = get_node("Player")

	# Error Handling & Getting Scripts
	if player: 
		player_script = player.get_script()
	else:
		print("Error: Player node not found!")

func _process(delta):
	pass
	#if get_tree().get_nodes_in_group("enemy").is_empty():
		#get_tree().change_scene_to_file("res://Scenes/Levels/ChoosePath.tscn")
