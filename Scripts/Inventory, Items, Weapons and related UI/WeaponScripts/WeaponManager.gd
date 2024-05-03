extends Node

var inventory = []

func add_weapon(weapon):
	inventory.append(weapon)
	print("Inventory contents: ", inventory) 

func _on_Player_picked_up_item(item):
	print("Received item in WeaponManager: ", item)  
	add_weapon(item) 
