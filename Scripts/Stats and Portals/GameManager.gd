extends Node
class_name GameManager

var player  
var power_portal  
var speed_portal
var health_portal

var player_script 
var end_of_level
var power_script 
var speed_script
var health_script

func _ready():
	# Find the player and portals (Must be children of the GameManager).
	player = get_node("Player")
	end_of_level = get_node("EndOfLevel")
	if end_of_level:
		power_portal = get_node("Power")
		speed_portal = get_node("Speed")
		health_portal = get_node("Health")
	else:
		print("Error: Portals not found")

	# Error Handling & Getting Scripts
	if player: 
		player_script = player.get_script()
	else:
		print("Error: Player node not found!")
	if power_portal: 
		power_script = power_portal.get_script()
	else:
		print("Error: Power Portal not found!")
	if speed_portal: 
		speed_script = speed_portal.get_script()
	else:
		print("Error: Speed Portal not found!")
	if health_portal: 
		health_script = health_portal.get_script()
	else:
		print("Error: Health Portal not found!")
