extends Node

signal picked_up_item(item) 

func _process(_delta):
	if Input.is_action_pressed("interact"):
		print("Interact button pressed!") 


func _on_weapon_area_can_be_picked_up(item):
	print("Received item in Interact: ", item) 
	if Input.is_action_pressed("interact"):  # Check if button is pressed currently
		item.queue_free() 
		emit_signal("picked_up_item", item)
