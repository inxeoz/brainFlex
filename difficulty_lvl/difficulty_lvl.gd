extends Node2D
var settings = load("res://settings/settings.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
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
	set_dif(DarkTheme.lvl1, DarkTheme.color5, DarkTheme.color5, 0, 2, 100)

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
	print("min ", min, " max ", max)
	
