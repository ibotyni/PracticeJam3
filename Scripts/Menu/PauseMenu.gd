extends CanvasLayer
@onready var pause_menu = $"."

#Pause Function, watches for PAUSE key press, then pauses game, opens pause menu.
#Watching for Esc Press every frame
func _input(event):
	if event.is_action_pressed("Pause"):
		print(event.as_text())
		pause_menu.visible = true
		get_tree().paused = true

#On Resume Button
func _on_pause_resume_pressed():
	pause_menu.visible = false
	get_tree().paused = false	

#Back to Main Menu
func _on_pause_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
