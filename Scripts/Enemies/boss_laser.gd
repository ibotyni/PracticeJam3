extends Area2D

@onready var animation_player = $AnimationPlayer
@export var damage := 50

func shoot() -> void:
	animation_player.play("firing")

func _on_body_entered(body):
	if body is Player:
		body.health -= damage
