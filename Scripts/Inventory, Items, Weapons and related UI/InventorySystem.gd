extends Node

func _ready():
	# Adjust spacing and main margins as needed
	var margin = 10 

	# Get a reference to the HBoxContainer
	var hbox_container = get_node("HBoxContainer (Main Container)")


	# Get references to child containers
	var weapon_container = hbox_container.get_node("HBoxContainer (Main Container)/VBoxContainer (Weapon)")
	var potion_container = hbox_container.get_node("HBoxContainer (Main Container)/VBoxContainer (Potion)")
	var coin_container = hbox_container.get_node("HBoxContainer (Main Container)/VBoxContainer (Coins)")


