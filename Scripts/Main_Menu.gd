extends CanvasLayer

@onready var main = $Main
@onready var settings = $Settings



func _on_button_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")

#Option's Button - Hides Main Menu and Shows Settings Menu.
func _on_button_options_pressed() :
	main.visible = false
	settings.visible = true

func _on_button_settings_back_pressed():
	main.visible = true
	settings.visible = false

func _on_button_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")

func _on_button_quit_pressed():
	get_tree().quit()
	
	pass # Replace with function body.
