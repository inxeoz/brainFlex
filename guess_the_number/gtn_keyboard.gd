extends Node2D
var buttons_color = []
var button_color
var p_c
var value = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_timer_timeout():
	print(" here we go ", value)
	button_color.color = p_c


func _on_button_0_pressed():
	$Timer.start()
	button_color = $Button_0/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "0"
	$Button_display/value_display_value.text = value
	


func _on_button_1_pressed():
	$Timer.start()
	button_color = $Button_1/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "1"
	$Button_display/value_display_value.text = value


func _on_button_2_pressed():
	$Timer.start()
	button_color = $Button_2/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "2"
	$Button_display/value_display_value.text = value


func _on_button_3_pressed():
	$Timer.start()
	button_color = $Button_3/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "3"
	$Button_display/value_display_value.text = value

func _on_button_4_pressed():
	$Timer.start()
	button_color = $Button_4/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "4"
	$Button_display/value_display_value.text = value

func _on_button_5_pressed():
	$Timer.start()
	button_color = $Button_5/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "5"
	$Button_display/value_display_value.text = value


func _on_button_6_pressed():
	$Timer.start()
	button_color = $Button_6/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "6"
	$Button_display/value_display_value.text = value

func _on_button_7_pressed():
	$Timer.start()
	button_color = $Button_7/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "7"
	$Button_display/value_display_value.text = value


func _on_button_9_pressed():
	$Timer.start()
	button_color = $Button_9/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "9"
	$Button_display/value_display_value.text = value

func _on_button_back_space_pressed():
	$Timer.start()
	button_color = $Button_backSpace/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value = value.substr(0, value.length()-1)
	$Button_display/value_display_value.text = value
	


func _on_button_display_pressed():
	$Timer.start()
	button_color =$Button_display/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4


func _on_button_enter_pressed():
	$Timer.start()
	button_color = $Button_enter/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	GtnGlobal.value = value.to_int()
	print(" ", GtnGlobal.value)
	
	


func _on_button_8_pressed():
	$Timer.start()
	button_color = $Button_8/ColorRect
	p_c = button_color.color
	button_color.color = DarkTheme.color4
	value += "8"
	$Button_display/value_display_value.text = value
