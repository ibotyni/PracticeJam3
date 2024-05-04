extends Area2D

var glow_sprite
var interaction_prompt
var player_in_range = false
var weapon_image 

#Transfering my custom data to the Weapon Manager!
@export var Weapon_Data : Resource
@onready var weapon_manager = get_node("/root/WeaponManager")


signal can_be_picked_up 

func _ready():
	glow_sprite = $GlowEffectWeapon
	weapon_image = $WeaponItemSprite2D
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
		hide() #hide the weapon. 
		var weapon_shader_material = get_node("WeaponItemSprite2D").material
		var glow_shader_material = get_node("GlowEffectWeapon").material
		weapon_manager.add_weapon(self, name, Weapon_Data, weapon_shader_material, glow_shader_material, weapon_image)
		player_in_range = false # Reset the flag immediately

#TO DO LIST: Make sure the weapon we pick up is stored to an array and then we need to actually use the data from the specific database to effect the values on the player.
