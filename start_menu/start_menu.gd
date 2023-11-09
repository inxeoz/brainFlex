extends Node2D
var settings  = load("res://settings/settings.tscn");
var profile = load("res://profile/profile.tscn");
var select_mode = load("res://select_mode/select_mode.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Color_bg.color = DarkTheme.color1
	$button_select_mode/ColorRect.color = DarkTheme.color2
	$button_play/ColorRect.color = DarkTheme.color2
	$button_quit/ColorRect.color = DarkTheme.color2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_select_mode_button_up():
	#$button_select_mode/ColorRect.color = DarkTheme.color4
	_ready()
	get_tree().change_scene_to_packed(select_mode)
	


func _on_button_select_mode_button_down():
	$button_select_mode/ColorRect.color = DarkTheme.color4


func _on_button_play_button_down():
	$button_play/ColorRect.color = DarkTheme.color4


func _on_button_play_button_up():
	#$button_play/ColorRect.color = DarkTheme.color4
	_ready()
	


func _on_button_quit_button_down():
	$button_quit/ColorRect.color = DarkTheme.color4


func _on_button_quit_button_up():
	#$button_quit/ColorRect.color = DarkTheme.color1
	_ready()
	get_tree().quit()


func _on_settings_pressed():
	get_tree().change_scene_to_packed(settings)


func _on_profile_pressed():
	get_tree().change_scene_to_packed(profile)
