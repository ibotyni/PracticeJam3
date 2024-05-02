extends Area2D
class_name PrimaryBullet

@export var speed = 600
@export var damage = 10

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	
	if body.is_in_group("enemy"):
		body.health -= damage;
	queue_free()

