extends Node

func _ready():
	var margin = 10 

	var hbox_container = get_node("HBoxContainer (Main Container)")

	var weapon_container = hbox_container.get_node("HBoxContainer (Main Container)/VBoxContainer (Weapon)")
	var potion_container = hbox_container.get_node("HBoxContainer (Main Container)/VBoxContainer (Potion)")
	var coin_container = hbox_container.get_node("HBoxContainer (Main Container)/VBoxContainer (Coins)")


