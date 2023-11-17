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
	$Color_bg.show_behind_parent = true
	
	$button_play.flat = true
	$button_play/RichTextLabel.mouse_filter = 2
	$button_play/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$button_play/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/NoizeSportFreeVertionRegular-MVwye.ttf"))
	$button_play/RichTextLabel.add_theme_font_size_override("normal_font_size", 45)
	$button_play/ColorRect.color = GlobalTheme.color_bg_sec
	$button_play/ColorRect.mouse_filter = 2
	$button_play/ColorRect.show_behind_parent = true
	
	$button_quit.flat = true
	$button_quit/RichTextLabel.mouse_filter = 2
	$button_quit/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$button_quit/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/NoizeSportFreeVertionRegular-MVwye.ttf"))
	$button_quit/RichTextLabel.add_theme_font_size_override("normal_font_size", 45)
	$button_quit/ColorRect.color = GlobalTheme.color_bg_sec
	$button_quit/ColorRect.mouse_filter = 2
	$button_quit/ColorRect.show_behind_parent = true
	
	$settings.icon = load("res://res/gear.png")
	$settings.flat = true
	$settings.size = Vector2(554, 612)
	$settings.position = Vector2(595, 14)
	$settings.scale  = Vector2(0.175, 0.175)
	$settings/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/Valorax-lg25V.otf"))
	$settings/RichTextLabel.add_theme_font_size_override("normal_font_size", 115)
	
	$profile.icon = load("res://res/user(2).png")
	$profile.flat = true
	$profile.size = Vector2(530, 600)
	$profile.position = Vector2(34, 27)
	$profile.scale  = Vector2(0.175, 0.175)
	$profile/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/Valorax-lg25V.otf"))
	$profile/RichTextLabel.add_theme_font_size_override("normal_font_size", 115)
	
