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
	
	$Button_guess_the_number/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_guess_the_number/ColorRect.color = GlobalTheme.white

	$Button_war_of_symbols/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_war_of_symbols/ColorRect.color = GlobalTheme.white
	
	$Button_next/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_next/ColorRect.color = GlobalTheme.highlight_easy_lvl2
	
	$Button_back/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click
