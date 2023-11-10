extends Node2D

var start_menu = load("res://start_menu/start_menu.tscn")
var mode_selected:bool = false
var gtn = load("res://guess_the_number/guess_the_number.tscn")
var wos = load("res://war_of_symbol/war_of_symbol.tscn")
var tochange:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(" hii ", gtn.get_class())


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
