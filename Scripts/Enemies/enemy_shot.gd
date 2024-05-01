extends Area2D
class_name EnemyShot

const SPEED = 200

var direction: Vector2 = Vector2()
var damage := 5

func _physics_process(delta):
	position += direction.normalized() * SPEED * delta

func _on_body_entered(body):
	if body is Player:
		# TODO function on player script to process damage
		body.health -= damage
	queue_free()

func _on_area_entered(area):
	queue_free()
