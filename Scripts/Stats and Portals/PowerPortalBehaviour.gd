extends Area2D

var interaction_prompt
@export var target_level : Resource

func _ready():
	interaction_prompt = $PowerInteraction
	interaction_prompt.visible = false
	add_to_group("interactables")  # Add this Area2D to the "interactables" group

func _on_body_entered(body):
	var player_vars = get_node("/root/PlayerVariables")
	player_vars.level_strength += 1
	
	var level = "res://Scenes/Levels/level{level}.tscn".format({"level": randi_range(0,15)})
	get_tree().change_scene_to_file(level)
