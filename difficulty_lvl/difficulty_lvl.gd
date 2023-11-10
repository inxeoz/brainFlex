extends Node2D
var settings = load("res://settings/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button_easy/ColorRect.color = DarkTheme.color5
	$Button_medium/ColorRect.color  = DarkTheme.color5
	$Button_hard/ColorRect.color  = DarkTheme.color5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_back_pressed():
	get_tree().change_scene_to_packed(settings);


func _on_button_easy_button_down():
	#$Button_easy/ColorRect.color = DarkTheme.color4
	pass
	


func _on_button_easy_button_up():
	$Button_easy/ColorRect.color = DarkTheme.lvl1
	$Button_medium/ColorRect.color = DarkTheme.color5
	$Button_hard/ColorRect.color = DarkTheme.color5
	
	


func _on_button_medium_button_down():
	pass
	#$Button_medium/ColorRect.color = DarkTheme.color4


func _on_button_medium_button_up():
	$Button_easy/ColorRect.color = DarkTheme.color5
	$Button_medium/ColorRect.color = DarkTheme.lvl2
	$Button_hard/ColorRect.color = DarkTheme.color5


func _on_button_hard_button_down():
	pass
	#$Button_hard/ColorRect.color = DarkTheme.color4


func _on_button_hard_button_up():
	$Button_easy/ColorRect.color = DarkTheme.color5
	$Button_medium/ColorRect.color = DarkTheme.color5
	$Button_hard/ColorRect.color = DarkTheme.lvl3
