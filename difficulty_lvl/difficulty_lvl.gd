extends Node2D
var settings = load("res://settings/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	make_it_ready()
	match Global.difficulty_lvl:
		0:
			_on_button_easy_pressed()
		1:
			_on_button_medium_pressed()
		2:
			_on_button_hard_pressed()
		_:
			print(" number of difficulty is out of range (0 - 2)")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_back_pressed():
	get_tree().change_scene_to_packed(settings);

func _on_button_easy_pressed():
	set_dif(DarkTheme.lvl1, DarkTheme.color5, DarkTheme.color5, 0, 2, 200)
func _on_button_medium_pressed():
	set_dif(DarkTheme.color5, DarkTheme.lvl2, DarkTheme.color5, 1, 2, 400)

func _on_button_hard_pressed():
	set_dif(DarkTheme.color5, DarkTheme.color5, DarkTheme.lvl3, 2, 2, 800)
	
func set_dif(easy_color:Color, medium_color:Color, hard_color:Color, dif_lvl:int, min:int, max:int):
	$Button_easy/ColorRect.color = easy_color
	$Button_medium/ColorRect.color = medium_color
	$Button_hard/ColorRect.color = hard_color
	Global.difficulty_lvl =dif_lvl
	Global.min_range = min
	Global.max_range = max
	Global.timer_time = 5600/max
	print("min ", min, " max ", max, " timer_time ", Global.timer_time)
	
func make_it_ready():
	$Color_bg.color = GlobalTheme.color_bg

	$Button_back/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click

	$Button_easy/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_easy/ColorRect.color = GlobalTheme.highlight_easy_lvl1
	$Button_easy/Sprite2D.texture = load("res://res/rat.png")

	$Button_medium/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_medium/ColorRect.color = GlobalTheme.highlight_dim_lvl1
	$Button_medium/Sprite2D.texture = load("res://res/cat.png")


	$Button_hard/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_hard/ColorRect.color = GlobalTheme.highlight_dim_lvl2
	$Button_hard/Sprite2D.texture = load("res://res/dog.png")
