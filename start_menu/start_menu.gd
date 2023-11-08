extends Node2D
var select_mode  = load("res://select_mode/select_mode.tscn");
var settings = load("res://settings/settings.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_select_mode_pressed():
	get_tree().change_scene_to_packed(select_mode);

func _on_button_play_pressed():
	pass # Replace with function body.


func _on_button_exit_pressed():
	get_tree().quit();


func _on_button_theme_pressed():
	pass # Replace with function body.


func _on_button_settings_pressed():
	get_tree().change_scene_to_packed(settings);

