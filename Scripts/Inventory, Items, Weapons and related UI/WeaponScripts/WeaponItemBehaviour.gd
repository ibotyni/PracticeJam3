extends Area2D

var glow_sprite 
var interaction_prompt
var player_in_range = false

signal can_be_picked_up 

func _ready():
	glow_sprite = $GlowEffectWeapon
	interaction_prompt = $ButtonPromptWeapon
	glow_sprite.visible = false
	interaction_prompt.visible = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		glow_sprite.visible = true
		interaction_prompt.visible = true 
		player_in_range = true 


func _on_body_exited(body):
	if body.is_in_group("player"):
		glow_sprite.visible = false
		interaction_prompt.visible = false
		player_in_range = false
		
func _process(delta): 
	if player_in_range and Input.is_action_just_pressed("interact"): 
		queue_free() # Delete the weapon
		emit_signal("picked_up_item", self) # Send signal if needed
		player_in_range = false # Reset the flag immediately

#TO DO LIST: Make sure the weapon we pick up is stored to an array and then we need to actually use the data from the specific database to effect the values on the player.
