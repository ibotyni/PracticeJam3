extends Node

signal picked_up_item(item) 

func _process(_delta):
	if Input.is_action_pressed("interact"):
		pass


func _on_weapon_area_can_be_picked_up(_item):
	pass
