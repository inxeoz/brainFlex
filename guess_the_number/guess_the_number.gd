extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")
var num1:int
var num2:int
var num3:int
var num4:int
var result1:int
var result2:int
var op1:int
var op2:int
var op1s:String
var op2s:String

# Called when the node enters the scene tree for the first time.
func _ready():
	next_lvl_values()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_back_pressed():
	get_tree().change_scene_to_packed(select_mode)
	
func next_lvl_values():
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
#		2:
#			num1 = randi_range(2, 100)
#			result_f_o = num1*result_s_o
#			print(num1, " * ", result_s_o," = ", result_f_o )
#		3:
#			num1 = randi_range(2, 100)*result_s_o
#			result_f_o = num1/result_s_o
#			print(num1, " / ", result_s_o," = ", result_f_o )
		_:
			print(" cant perfom first op ")
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
#		2:
#			num2 = randi_range(2, 50)
#			num3 = randi_range(2, 50)
#			result_s_o = num2*num3
#			print(num2, " * ", num3, " = ", result_s_o )
#		3:
#			num3 = randi_range(2, 50)
#			num2 = randi_range(2, 50)*num3
#			result_s_o = num2/num3
#			print(num2, " / ", num3," = ", result_s_o )
		_:
			print(" cant perfom first op ")
	

	print(num1, " ", num2, " ", num3, " ", op1, " ", op2, " ", result1, " ", result2)
	
	

	


func _on_button_reset_pressed():
	next_lvl_values()
	$Button_num1/value_num1.text = str(num1)
	$Button_num2/value_num1.text =op1s
	$Button_num3/value_num1.text = str(num2)
	$Button_num4/value_num1.text = op2s
	$Button_num5/value_num1.text = str(num3)
	$Button_num6/value_num1.text = str(result2)
	
	
