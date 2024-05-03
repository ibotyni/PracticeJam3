extends Area2D

func _on_area_entered(area):
	if area.get_parent() is Player || area.get_parent() is Enemy:
			area.get_parent().death()
