extends Node2D
var buttons_color = []

# Called when the node enters the scene tree for the first time.
func _ready():
	buttons_color.append($Button_0/ColorRect)
	buttons_color.append($Button_1/ColorRect)
	buttons_color.append($Button_2/ColorRect)
	buttons_color.append($Button_3/ColorRect)
	buttons_color.append($Button_4/ColorRect)
	buttons_color.append($Button_5/ColorRect)
	buttons_color.append($Button_6/ColorRect)
	buttons_color.append($Button_7/ColorRect)
	buttons_color.append($Button_8/ColorRect)
	buttons_color.append($Button_9/ColorRect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_8_press(p):
	print(" i got ", p)
