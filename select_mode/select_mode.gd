extends Node2D

var start_menu = load("res://start_menu/start_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_back_pressed():
	get_tree().change_scene_to_packed(start_menu)


func _on_button_guess_the_number_pressed():
	$Button_guess_the_number/ColorRect.color = DarkTheme.color6g
	$Button_war_of_symbols/ColorRect.color = DarkTheme.color3
	$Button_next/ColorRect.color = DarkTheme.color4


func _on_button_war_of_symbols_pressed():
	$Button_guess_the_number/ColorRect.color = DarkTheme.color3
	$Button_war_of_symbols/ColorRect.color = DarkTheme.color6g
	$Button_next/ColorRect.color = DarkTheme.color4
