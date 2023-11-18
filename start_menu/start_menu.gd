extends Node2D
var settings  = load("res://settings/settings.tscn");
var profile = load("res://profile/profile.tscn");
var select_mode = load("res://select_mode/select_mode.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	make_it_ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_select_mode_button_down():
	$button_select_mode/ColorRect.color = DarkTheme.color4


func _on_button_play_button_down():
	$button_play/ColorRect.color = DarkTheme.color4


func _on_button_play_button_up():
	_ready()
	get_tree().change_scene_to_packed(select_mode)
	


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
	
func make_it_ready():
	$Color_bg.color = GlobalTheme.color_bg
	
	$button_play/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$button_play/ColorRect.color = GlobalTheme.color_bg_sec
	

	$button_quit/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$button_quit/ColorRect.color = GlobalTheme.color_bg_sec

	
	$settings.icon = load("res://res/gear.png")

	$profile.icon = load("res://res/user(2).png")
	
	
