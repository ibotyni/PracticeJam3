extends Area2D
class_name SpikeHazard

func _process(delta):
	var touching = get_overlapping_areas()
	for area in touching:
		var entity = area.get_parent()
		if entity is Player:
			entity.health -= 5
		elif entity is Enemy:
			entity.take_damage(5)
