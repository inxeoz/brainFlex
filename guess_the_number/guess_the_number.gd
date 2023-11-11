extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")


var num_button:Array
var num_int:Array = [0, 0 , 0, 0]
var hide_num:int
var op:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	num_button.append($Button_num1)
	num_button.append($Button_num2)
	num_button.append($Button_num3)
	num_button.append($Button_num4)
	next_lvl_values()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_back_pressed():
	get_tree().change_scene_to_packed(select_mode)
	
func next_lvl_values():
	var num1:int
	var num2:int
	var num3:int
	var num4:int
	var op1:int
	var op2:int
	var result1:int
	var result2:int
	var op1s:String
	var op2s:String
	op1 = randi_range(0, 1)
	match op1:
		0:
			num1 = randi_range(2, 100)
			num2 = randf_range(2, 100)
			result1 = num1+num2
			print(num1, " + ", num2," = ", result1 )
			op1s = "+"
		1:
			num2 = randf_range(2, 100)
			num1 = randi_range(2, 100)+num2
			result1 = num1-num2
			print(num1, " - ", num2," = ", result1 )
			op1s = "-"
			
		_:
			print(" cant perfom first op ")
	num_int[0] = num1
	num_int[1] = num2
	op.append(op1s)
	op2 = randi_range(0, 1)
	# + - x %
	match op2:
		0:
			num3 = randi_range(2, 100)
			result2 = result1+num3
			print(result1, " + ", num3, " = ", result2 )
			op2s = "+"
		1:
			num3 = randi_range(1, result1)
			result2 = result1 - num3
			print(result1, " - ", num3, " = ", result2 )
			op2s = "-"
		_:
			print(" cant perfom second op ")
	num_int[2] = num3
	num_int[3] = result2
	op.append(op2s)
	print(num1, op1s, num2, op2s, num3, " = ",result2)
	

func _on_button_reset_pressed():
	next_lvl_values()
	hide_num = randi_range(0, num_button.size()-1)
	print(" hide in " , hide_num)
	for i in range(0, num_button.size()):
		if i != hide_num:
			var butn:Button = num_button[i]
			butn.get_node("value").text = str(num_int[i])
		else:
			var butn:Button = num_button[i]
			butn.get_node("value").text = ""
			butn.get_node("ColorRect").color = DarkTheme.color2
	$Button_op1/value.text =op[0]
	$Button_op2/value.text =op[1]
	
func _on_keyboard_value_entered():
	if(num_int[hide_num] == GtnGlobal.value):
		print("you got it right ", num_int[hide_num])
		$keyboard/Button_display/ColorRect.color = DarkTheme.green_l
