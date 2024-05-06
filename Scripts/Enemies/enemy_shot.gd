extends Area2D
class_name EnemyShot

@export var SPEED = 150

var direction: Vector2 = Vector2()
var damage := 1
	
func _physics_process(delta):
	position += direction.normalized() * SPEED * delta

func _on_body_entered(body):
	if body is Player:
		# TODO function on player script to process damage
		body.health -= damage
	queue_free()

func _on_area_entered(area):
	if area.name != "FeetHitbox" && !(area is EnemyShot):
		queue_free()
