extends Area2D
class_name SpikeHazard

@export var knockback_strength = 10
@export var damage = 2

func _process(delta):
	var touching = get_overlapping_areas()
	for area in touching:
		var entity = area.get_parent()
		if entity is Player:
			entity.health -= damage
			entity.position = entity.position - knockback_strength*(entity.direction.normalized())
		#elif entity is Enemy:
			#entity.take_damage(5)
