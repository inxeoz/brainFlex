extends Node2D
var color_rect:ColorRect
var color_str:Color
var value_str =  ""
signal value_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_timer_timeout():
	print(" here we go ", value_str)
	color_rect.color = color_str


func _on_button_0_pressed():
	each_button_func($Button_0/ColorRect, "0")
	


func _on_button_1_pressed():
	each_button_func($Button_1/ColorRect, "1")



func _on_button_2_pressed():
	each_button_func($Button_2/ColorRect, "2")


func _on_button_3_pressed():
	each_button_func($Button_3/ColorRect, "3")
	

func _on_button_4_pressed():
	each_button_func($Button_4/ColorRect, "4")


func _on_button_5_pressed():
	each_button_func($Button_5/ColorRect, "5")


func _on_button_6_pressed():
	each_button_func($Button_6/ColorRect, "6")

func _on_button_7_pressed():
	each_button_func($Button_7/ColorRect, "7")

func _on_button_9_pressed():
	each_button_func($Button_9/ColorRect, "9")

func _on_button_back_space_pressed():
	value_str= value_str.substr(0, value_str.length()-1)
	each_button_func($Button_backSpace/ColorRect)
	

func _on_button_display_pressed():
	#$Timer.start()
	#button_color =$Button_display/ColorRect
	#p_c = button_color.color
	#button_color.color = DarkTheme.color4
	pass


func _on_button_enter_pressed():
	GtnGlobal.value = value_str.to_int()
	each_button_func($Button_enter/ColorRect)
	value_entered.emit()
	#$Timer.start()
	#button_color = $Button_enter/ColorRect
	#p_c = button_color.color
	#button_color.color = DarkTheme.color4
	#GtnGlobal.value = value.to_int()
	#print(" ", GtnGlobal.value)
	pass
	
	


func _on_button_8_pressed():
	each_button_func($Button_8/ColorRect, "8")
	
func each_button_func(color_node:ColorRect, str_value= "-1"):
	$Timer.start()
	color_rect = color_node
	color_str = color_rect.color
	color_rect.color = DarkTheme.color4
	if(str_value != "-1"):
		value_str += str_value
	$Button_display/value_display_value.text = value_str
	
	

