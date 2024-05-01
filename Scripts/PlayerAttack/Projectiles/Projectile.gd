extends Area2D

@export var speed = 750
@export var damage = 1


func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Projectile_body_entered(body):
	if body.is_in_group("mobs"):
		# We'll handle applying damage later
		body.queue_free() 
	queue_free() 
