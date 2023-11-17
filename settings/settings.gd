extends Node2D
var start_menu = load("res://start_menu/start_menu.tscn");
var difficulty_lvl = load("res://difficulty_lvl/difficulty_lvl.tscn");
var hints = load("res://hint_status/Hint_status.tscn");
var profile = load("res://profile/profile.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button_difficulty_lvl/ColorRect.color = DarkTheme.color2
	$Button_Hints/ColorRect.color = DarkTheme.color2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_back_pressed():
	get_tree().change_scene_to_packed(start_menu)
	
func _on_button_difficulty_lvl_button_down():
	$Button_difficulty_lvl/ColorRect.color = DarkTheme.color4


func _on_button_difficulty_lvl_button_up():
	_ready()
	get_tree().change_scene_to_packed(difficulty_lvl)


func _on_button_hints_button_down():
	$Button_Hints/ColorRect.color = DarkTheme.color4


func _on_button_hints_button_up():
	_ready()
	get_tree().change_scene_to_packed(hints)
	
func make_it_ready():
	$ColorRect.color = GlobalTheme.color_bg
	$ColorRect.show_behind_parent = true
	
	$Button_difficulty_lvl.flat = true
	$Button_difficulty_lvl/RichTextLabel.mouse_filter = 2
	$Button_difficulty_lvl/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/EvilEmpire-4BBVK.ttf") )
	$Button_difficulty_lvl/RichTextLabel.add_theme_font_size_override("normal_font_size", 41)
	$Button_difficulty_lvl/ColorRect.color = GlobalTheme.color_bg_sec
	$Button_difficulty_lvl/ColorRect.mouse_filter = 2
	$Button_difficulty_lvl/ColorRect.show_behind_parent = true
	
	$Button_Hints.flat = true
	$Button_Hints/RichTextLabel.mouse_filter = 2
	$Button_Hints/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/EvilEmpire-4BBVK.ttf") )
	$Button_Hints/RichTextLabel.add_theme_font_size_override("normal_font_size", 41)
	$Button_Hints/ColorRect.color = GlobalTheme.color_bg_sec
	$Button_Hints/ColorRect.mouse_filter = 2
	$Button_Hints/ColorRect.show_behind_parent = true
	
	$Button_back.flat = true
	$Button_back/RichTextLabel.mouse_filter = 2
	$Button_back/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/EvilEmpire-4BBVK.ttf") )
	$Button_back/RichTextLabel.add_theme_font_size_override("normal_font_size", 41)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click
	$Button_back/ColorRect.mouse_filter = 2
	$Button_back/ColorRect.show_behind_parent = true
	
