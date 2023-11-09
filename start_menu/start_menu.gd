extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$Color_bg.color = DarkTheme.color1
	$button_select_mode/ColorRect.color = DarkTheme.color5
	$button_play/ColorRect.color = DarkTheme.color5
	$button_quit/ColorRect.color = DarkTheme.color5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_select_mode_button_up():
	#$button_select_mode/ColorRect.color = DarkTheme.color4
	_ready()
	


func _on_button_select_mode_button_down():
	$button_select_mode/ColorRect.color = DarkTheme.color4


func _on_button_play_button_down():
	$button_play/ColorRect.color = DarkTheme.color4


func _on_button_play_button_up():
	#$button_play/ColorRect.color = DarkTheme.color4
	_ready()
	


func _on_button_quit_button_down():
	$button_quit/ColorRect.color = DarkTheme.color4


func _on_button_quit_button_up():
	#$button_quit/ColorRect.color = DarkTheme.color1
	_ready()
