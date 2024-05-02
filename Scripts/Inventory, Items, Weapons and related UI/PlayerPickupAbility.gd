extends CharacterBody2D

@export(NodePath) var inventory_system_node
var inventory_system : InventorySystem 

var interact_range = 20 # Distance within which an item can be picked up

func _ready():
	 inventory_system = get_node(inventory_system_node)

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		check_for_pickup()


func check_for_pickup():
	var overlapping_areas = get_overlapping_areas()
	for area in overlapping_areas:
		 if area.has_script("ItemPickup.gd"):
			 area.queue_free() # Directly remove the area upon pickup

			 if area.item_type == "coin":
				 inventory_system.add_coins(1)  # Example: Assuming you add 1 coin
			 elif area.item_type == "potion":
				 inventory_system.add_potion()  
			 # ... You can add more cases for other types of items
