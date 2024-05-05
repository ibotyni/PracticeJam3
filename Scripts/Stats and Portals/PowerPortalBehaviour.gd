extends Area2D

var interaction_prompt
@export var target_level : Resource

func _ready():
	interaction_prompt = $PowerInteraction
	interaction_prompt.visible = false
	add_to_group("interactables")  # Add this Area2D to the "interactables" group

func _on_body_entered(body):
	if body.is_in_group("player"):  
		interaction_prompt.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"): 
		interaction_prompt.visible = false

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		var player = get_tree().get_nodes_in_group("player")[0]  # Get the player
