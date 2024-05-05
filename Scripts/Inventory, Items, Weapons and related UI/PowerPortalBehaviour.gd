extends Area2D

var interaction_prompt  # Store a reference to your X button prompt
@onready var player = get_node("res://Scenes/Player/Player.tscn")  

func _ready():
	interaction_prompt = $PowerInteraction
	interaction_prompt.visible = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		interaction_prompt.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		interaction_prompt.visible = false

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if player:
			# Portal activation logic - Interact with the player node here
			pass 
