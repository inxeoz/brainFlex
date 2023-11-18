extends Node2D
var button_color_node:ColorRect
var color_normal:Color
@onready var display_value = $color_display/value_display_value
var input = ""
signal value_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_timer_timeout():
	button_color_node.color = color_normal
	$Timer.stop()

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

func _on_button_8_pressed():
	each_button_func($Button_8/ColorRect, "8")

func _on_button_9_pressed():
	each_button_func($Button_9/ColorRect, "9")
	
func each_button_func(color_rect:ColorRect, str_value= "-1"):
	$Timer.start()
	button_color_node = color_rect
	color_normal = button_color_node.color
	button_color_node.color = DarkTheme.color_on_click
	if(str_value != "-1"):
		input  += str_value
	display_value.text = input
	
func _on_button_back_space_pressed():
	var length= input.length()
	input = input.substr(0, length-1)
	each_button_func($Button_backSpace/ColorRect)

func _on_button_enter_pressed():
	each_button_func($Button_enter/ColorRect)
	value_entered.emit(input)


func _on_button_neg_pressed():
	input = str(-1 * input.to_int())
	each_button_func($Button_neg/ColorRect)
