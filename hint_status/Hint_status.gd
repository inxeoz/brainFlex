extends Node2D
var settings = load("res://settings/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button_on/ColorRect.color = DarkTheme.color5
	$Button_off/ColorRect.color = DarkTheme.color6g
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_button_back_pressed():
	get_tree().change_scene_to_packed(settings);

func _on_button_off_pressed():
	$Button_on/ColorRect.color = DarkTheme.color5
	$Button_off/ColorRect.color = DarkTheme.color6g
func _on_button_on_pressed():
	$Button_on/ColorRect.color = DarkTheme.color6g
	$Button_off/ColorRect.color = DarkTheme.color5
