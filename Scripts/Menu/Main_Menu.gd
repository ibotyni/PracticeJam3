extends CanvasLayer

@onready var main = $Main
@onready var settings = $Settings
@onready var audioPlayer = $"../AudioStreamPlayer"
@onready var on_hover = $"../On_Hover"
@onready var on_confirm = $"../On_Confirm"


func _on_button_start_pressed():
	on_confirm.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Levels/level1.tscn")

#Option's Button - Hides Main Menu and Shows Settings Menu.
func _on_button_options_pressed() :
	on_confirm.play()
	await get_tree().create_timer(0.2).timeout
	main.visible = false
	settings.visible = true

func _on_button_settings_back_pressed():
	on_confirm.play()
	await get_tree().create_timer(0.2).timeout
	main.visible = true
	settings.visible = false

func _on_button_credits_pressed():
	on_confirm.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")

func _on_button_quit_pressed():
	on_confirm.play()
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()


#On Hover/Focus instructions:
func _on_button_start_mouse_entered():
	on_hover.play()
	pass # Replace with function body.

func _on_button_options_mouse_entered():
	on_hover.play()
	pass # Replace with function body.

func _on_button_credits_mouse_entered():
	on_hover.play()
	pass # Replace with function body.

func _on_button_quit_mouse_entered():
	on_hover.play()
	pass # Replace with function body.

func _on_button_settings_back_mouse_entered():
	on_hover.play()
	pass # Replace with function body.

