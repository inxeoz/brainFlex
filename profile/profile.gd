extends Node2D
var start_menu = load("res://start_menu/start_menu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	make_it_ready()
	$attempts_value.text = str(Global.success + Global.failure)
	if Global.hint_status_on:
		$hint_status_value.text ="on"
	else:
		$hint_status_value.text = "off"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_back_pressed():
	get_tree().change_scene_to_packed(start_menu);

func make_it_ready():
	$color_bg.color = GlobalTheme.color_bg
	
	$Button_back/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click
	
	$attempts_text.add_theme_color_override("default_color", GlobalTheme.white)
	$attempts_value.add_theme_color_override("default_color", GlobalTheme.white)
	$hint_status_text.add_theme_color_override("default_color", GlobalTheme.white)
	$hint_status_value.add_theme_color_override("default_color", GlobalTheme.white)
	
