extends Node

var inventory = []
@onready var PlayerInventory = get_node("/root/GeneralUiCanvas")
@onready var inventory_system = PlayerInventory.get_node("InventoryManagerUI")


func add_weapon(weapon_node, weapon_name, Weapon_Data, weapon_shader_material, glow_shader_material, weapon_image):
	inventory.append({ 'node': weapon_node, 
	'name': weapon_name, 'data': Weapon_Data, 
	#WeaponUI
	'is_bronze': Weapon_Data.isBronze,
	'is_silver': Weapon_Data.isSilver,
	'is_gold': Weapon_Data.isGold,
	'is_diamond': Weapon_Data.isDiamond,
	'is_bow': Weapon_Data.isBow, 
	'is_spear': Weapon_Data.isSpear,
	'is_staff': Weapon_Data.isStaff })



	# Update the Inventory UI
	inventory_system.update_weapon_icon(Weapon_Data, Weapon_Data.isBronze, Weapon_Data.isSilver, Weapon_Data.isGold, Weapon_Data.isDiamond, Weapon_Data.isBow, Weapon_Data.isSpear, Weapon_Data.isStaff)
