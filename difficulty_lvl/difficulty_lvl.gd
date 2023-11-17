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
	$Color_bg.show_behind_parent = true
	
	$Button_back.flat = true
	$Button_back.size = Vector2(108, 58)
	$Button_back.position = Vector2(59, 45)
	$Button_back/RichTextLabel.size = Vector2(90, 40)
	$Button_back/RichTextLabel.position = Vector2(8, 10)
	$Button_back/RichTextLabel.mouse_filter = 2
	$Button_back/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$Button_back/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/EvilEmpire-4BBVK.ttf"))
	$Button_back/RichTextLabel.add_theme_font_size_override("normal_font_size", 26)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click
	$Button_back/ColorRect.mouse_filter = 2
	$Button_back/ColorRect.show_behind_parent = true
	
	$Button_easy.flat = true
	$Button_easy.size = Vector2(416, 72)
	$Button_easy.position = Vector2(152, 312)
	$Button_easy/RichTextLabel.size = Vector2(81, 44)
	$Button_easy/RichTextLabel.position = Vector2(15, 16)
	$Button_easy/RichTextLabel.scale = Vector2(1.023, 1.018)
	$Button_easy/RichTextLabel.mouse_filter = 2
	$Button_easy/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_easy/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/EvilEmpire-4BBVK.ttf"))
	$Button_easy/RichTextLabel.add_theme_font_size_override("normal_font_size", 40)
	$Button_easy/ColorRect.color = GlobalTheme.highlight_easy_lvl1
	$Button_easy/ColorRect.mouse_filter = 2
	$Button_easy/ColorRect.show_behind_parent = true
	#$Button_easy/ColorRect.size = Vector2(416, 72)
	$Button_easy/Sprite2D.texture = load("res://res/rat.png")
	$Button_easy/Sprite2D.position =Vector2(380, 36)
	$Button_easy/Sprite2D.scale = Vector2(0.06, 0.06)
	
	$Button_medium.flat = true
	$Button_medium.size = Vector2(416, 72)
	$Button_medium.position = Vector2(152, 440)
	$Button_medium/RichTextLabel.size = Vector2(131, 44)
	$Button_medium/RichTextLabel.position = Vector2(14, 17)
	$Button_medium/RichTextLabel.scale = Vector2(1.023, 1.018)
	$Button_medium/RichTextLabel.mouse_filter = 2
	$Button_medium/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_medium/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/EvilEmpire-4BBVK.ttf"))
	$Button_medium/RichTextLabel.add_theme_font_size_override("normal_font_size", 40)
	$Button_medium/ColorRect.color = GlobalTheme.highlight_dim_lvl1
	$Button_medium/ColorRect.mouse_filter = 2
	$Button_medium/ColorRect.show_behind_parent = true
	#$Button_easy/ColorRect.size = Vector2(416, 72)
	$Button_medium/Sprite2D.texture = load("res://res/cat.png")
	$Button_medium/Sprite2D.position =Vector2(386, 36)
	$Button_medium/Sprite2D.scale = Vector2(0.11, 0.119)

	$Button_hard.flat = true
	$Button_hard.size = Vector2(416, 72)
	$Button_hard.position = Vector2(152, 568)
	$Button_hard/RichTextLabel.size = Vector2(77, 43)
	$Button_hard/RichTextLabel.position = Vector2(14, 19)
	$Button_hard/RichTextLabel.scale = Vector2(1.023, 1.018)
	$Button_hard/RichTextLabel.mouse_filter = 2
	$Button_hard/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.black)
	$Button_hard/RichTextLabel.add_theme_font_override("normal_font", load("res://res/font/EvilEmpire-4BBVK.ttf"))
	$Button_hard/RichTextLabel.add_theme_font_size_override("normal_font_size", 40)
	$Button_hard/ColorRect.color = GlobalTheme.highlight_dim_lvl2
	$Button_hard/ColorRect.mouse_filter = 2
	$Button_hard/ColorRect.show_behind_parent = true
	#$Button_easy/ColorRect.size = Vector2(416, 72)
	$Button_hard/Sprite2D.texture = load("res://res/dog.png")
	$Button_hard/Sprite2D.position =Vector2(373, 36)
	$Button_hard/Sprite2D.scale = Vector2(0.127, 0.127)
