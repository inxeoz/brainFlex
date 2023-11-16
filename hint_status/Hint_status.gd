extends Node2D
var settings = load("res://settings/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.hint_status_on:
		_on_button_on_pressed()
	else:
		_on_button_off_pressed()
func _process(delta):
	pass
	
func _on_button_back_pressed():
	get_tree().change_scene_to_packed(settings);

func _on_button_off_pressed():
	$Button_on/ColorRect.color = DarkTheme.color5
	$Button_off/ColorRect.color = DarkTheme.color6g
	Global.hint_status_on = false
	print("hint status ", Global.hint_status_on)
func _on_button_on_pressed():
	$Button_on/ColorRect.color = DarkTheme.color6g
	$Button_off/ColorRect.color = DarkTheme.color5
	Global.hint_status_on = true
	print("hint status ", Global.hint_status_on)
