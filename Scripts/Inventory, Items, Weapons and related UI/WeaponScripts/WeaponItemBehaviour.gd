extends Area2D

var glow_sprite
var inetraction_prompt

func _ready():
	glow_sprite = $GlowEffectWeapon
	inetraction_prompt = $ButtonPromptWeapon
	glow_sprite.visible = false
	inetraction_prompt.visible = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		glow_sprite.visible = true
		inetraction_prompt.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		glow_sprite.visible = false
		inetraction_prompt.visible = false

