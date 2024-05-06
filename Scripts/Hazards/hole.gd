extends Area2D

@export var knockback_strength = 10 
@export var damage = 4

func _on_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().health -= damage
		area.get_parent().position = area.get_parent().position - knockback_strength*(area.get_parent().direction.normalized())
