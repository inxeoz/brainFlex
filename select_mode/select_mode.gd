extends Node2D

var start_menu = load("res://start_menu/start_menu.tscn")
var mode_selected:bool = false
var gtn = load("res://guess_the_number/guess_the_number.tscn")
var wos = load("res://war_of_symbol/war_of_symbol.tscn")
var tochange:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	make_it_ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_back_pressed():
	get_tree().change_scene_to_packed(start_menu)


func _on_button_guess_the_number_pressed():
	$Button_guess_the_number/ColorRect.color = DarkTheme.color6g
	$Button_war_of_symbols/ColorRect.color = DarkTheme.color3
	$Button_next/ColorRect.color = DarkTheme.color4
	mode_selected = true
	tochange = gtn


func _on_button_war_of_symbols_pressed():
	$Button_guess_the_number/ColorRect.color = DarkTheme.color3
	$Button_war_of_symbols/ColorRect.color = DarkTheme.color6g
	$Button_next/ColorRect.color = DarkTheme.color4
	mode_selected = true
	tochange = wos


func _on_button_next_pressed():
	get_tree().change_scene_to_packed(tochange)
func make_it_ready():
	$Color_bg.color = GlobalTheme.color_bg
	$Color_bg.size = Vector2(720, 1280)
	$Color_bg.position = Vector2(0, 0)
	$Color_bg.show_behind_parent = true
	
	$Button_guess_the_number.flat = true
	$Button_guess_the_number.size = Vector2(408, 108)
	$Button_guess_the_number.position = Vector2(162, 237)
	$Button_guess_the_number/RichTextLabel.size =Vector2(364, 38)
	$Button_guess_the_number/RichTextLabel.position =Vector2(23, 36)
	$Button_guess_the_number/RichTextLabel.mouse_filter = 2
	$Button_guess_the_number/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_guess_the_number/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/Valorax-lg25V.otf") )
	$Button_guess_the_number/RichTextLabel.add_theme_font_size_override("normal_font_size", 28)
	$Button_guess_the_number/ColorRect.color = GlobalTheme.white
	$Button_guess_the_number/ColorRect.size = Vector2(408, 108)
	$Button_guess_the_number/ColorRect.mouse_filter = 2

	$Button_war_of_symbols.flat = true
	$Button_war_of_symbols.size = Vector2(408, 108)
	$Button_war_of_symbols.position = Vector2(162, 237)
	$Button_war_of_symbols/RichTextLabel.size =Vector2(364, 38)
	$Button_war_of_symbols/RichTextLabel.position =Vector2(23, 36)
	$Button_war_of_symbols/RichTextLabel.mouse_filter = 2
	$Button_war_of_symbols/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_war_of_symbols/RichTextLabel.add_theme_font_override("normal_font",load("res://res/font/Valorax-lg25V.otf") )
	$Button_war_of_symbols/RichTextLabel.add_theme_font_size_override("normal_font_size", 28)
	$Button_war_of_symbols/ColorRect.color = GlobalTheme.white
	$Button_war_of_symbols/ColorRect.size = Vector2(408, 108)
	$Button_war_of_symbols/ColorRect.mouse_filter = 2
