extends Area2D
class_name SpikeHazard

var knockback_strength = 10.0

func _process(delta):
	var touching = get_overlapping_areas()
	for area in touching:
		var entity = area.get_parent()
		if entity is Player:
			entity.health -= 5
			entity.position = entity.position - knockback_strength*(entity.direction.normalized())
			entity.move_and_slide()
		elif entity is Enemy:
			entity.take_damage(5)
