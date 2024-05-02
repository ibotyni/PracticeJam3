extends Area2D
class_name CrackedFloor

@onready var collapse_timer: Timer = $CollapseTimer
@onready var sprite: Sprite2D = $Sprite2D

var is_collapsing := false
var collapsed := false

func _process(delta):
	if !collapsed:
		var touching = get_overlapping_areas()
		if touching.is_empty() && !collapse_timer.is_stopped():
			is_collapsing = false
			print("stopped collapsing")
			collapse_timer.stop()
		elif !touching.is_empty() && collapse_timer.is_stopped():
			for area in touching:
				var entity = area.get_parent()
				if entity is Player || entity is Enemy:
					is_collapsing = true
					print("collapsing")
					collapse_timer.start()

func collapse() -> void:
	sprite.frame = 12
	collapsed = true
	monitoring = false
	monitoring = true

func _on_area_entered(area):
	if collapsed:
		if area.get_parent() is Player || area.get_parent() is Enemy:
			area.get_parent().die()
