extends Node2D
var settings = load("res://settings/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	make_it_ready()
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
func make_it_ready():
	$Color_bg.color = GlobalTheme.color_bg
	$Color_bg.size = Vector2(720, 1280)
	$Color_bg.position = Vector2(0 ,0)
	$Color_bg.show_behind_parent = true
	
	$Button_on.flat = true
	$Button_on.size = Vector2(148, 74)
	$Button_on.position = Vector2(148, 399)
	$Button_on/RichTextLabel.size =Vector2(50, 45)
	$Button_on/RichTextLabel.position =Vector2(30, 11)
	$Button_on/RichTextLabel.mouse_filter = 2
	$Button_on/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_on/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/EvilEmpire-4BBVK.ttf") )
	$Button_on/RichTextLabel.add_theme_font_size_override("normal_font_size", 41)
	$Button_on/ColorRect.color = GlobalTheme.white
	$Button_on/ColorRect.size = Vector2(148, 74)
	$Button_on/ColorRect.mouse_filter = 2
	
	$Button_off.flat = true
	$Button_off.size = Vector2(148, 74)
	$Button_off.position = Vector2(433, 399)
	$Button_off/RichTextLabel.size =Vector2(65, 45)
	$Button_off/RichTextLabel.position =Vector2(30, 11)
	$Button_off/RichTextLabel.mouse_filter = 2
	$Button_off/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_off/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/EvilEmpire-4BBVK.ttf") )
	$Button_off/RichTextLabel.add_theme_font_size_override("normal_font_size", 41)
	$Button_off/ColorRect.color = GlobalTheme.white
	$Button_off/ColorRect.size = Vector2(148, 74)
	$Button_off/ColorRect.mouse_filter = 2
	
	$Button_back.flat = true
	$Button_back.size = Vector2(108, 58)
	$Button_back.position = Vector2(59, 45)
	$Button_back/RichTextLabel.size =Vector2(90, 40)
	$Button_back/RichTextLabel.position =Vector2(8, 10)
	$Button_back/RichTextLabel.mouse_filter = 2
	$Button_back/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$Button_back/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/EvilEmpire-4BBVK.ttf") )
	$Button_back/RichTextLabel.add_theme_font_size_override("normal_font_size", 26)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click
	$Button_back/ColorRect.size = Vector2(108, 59)
	$Button_back/ColorRect.mouse_filter = 2
