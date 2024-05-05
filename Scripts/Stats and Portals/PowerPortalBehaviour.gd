extends Area2D

var statue_eyes_red
var statue_eyes_green
var statue_eyes_yellow
var interaction_prompt
@export var target_level : PackedScene




func _ready():
	interaction_prompt = $PowerInteraction #Grab the X interaction icon
	statue_eyes_red = $"../../Godess/GlowRed"
	statue_eyes_red.visible = false
	interaction_prompt.visible = false #Make X interaction icon invisible
	add_to_group("interactables")  #Add this portal to the interactable group


func _on_body_entered(body):
	if body.is_in_group("player"):  #Detection of player group
		interaction_prompt.visible = true #Make X Visible
		statue_eyes_red.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"): #Player group has left radius
		interaction_prompt.visible = false #Make X invisible
		statue_eyes_red.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("Interact button pressed")  # Print when the button is pressed
		var player = get_tree().get_nodes_in_group("player")[0] 
		if player and target_level: 
			print("Player and target level found") # Print if both exist 
			get_tree().change_scene_to_packed(target_level)  
