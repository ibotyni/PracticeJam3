extends Node
class_name GameManager

var player  

var player_script 

func _ready():
	# Find the player and portals (Must be children of the GameManager).
	player = get_node("Player")

	# Error Handling & Getting Scripts
	if player: 
		player_script = player.get_script()
	else:
		print("Error: Player node not found!")
