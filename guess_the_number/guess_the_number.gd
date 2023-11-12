extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")
@onready var display = $keyboard/color_display
var display_color_normal:Color = DarkTheme.color5
var hide_num:int
var time = 0
@onready var value_score = $score_color/value_score

# Called when the node enters the scene tree for the first time.
func _ready():
	GtnGlobal.op_sym.clear()
	GtnGlobal.num_values.clear()
	GtnGlobal.num_color.clear()
	GtnGlobal.op_color.clear()
	
	GtnGlobal.num_color.append($num_color1)
	GtnGlobal.num_color.append($num_color2)
	GtnGlobal.num_color.append($num_color3)
	GtnGlobal.num_color.append($num_color4)
	GtnGlobal.op_color.append($op_color1)
	GtnGlobal.op_color.append($op_color2)
	_on_button_reset_pressed()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_back_pressed():
	get_tree().change_scene_to_packed(select_mode)
	
func next_lvl_values():
	var num0:int
	var num1:int
	var num2:int
	var num3:int
	var res1:int
	var res2:int
	GtnGlobal.op_sym.clear()
	GtnGlobal.num_values.clear()
	var op = randi_range(0, 1)
	match op:
		0:
			num0 = (randi_range(2, 100))
			num1 = (randi_range(2, 100))
			res1 = num0+num1
			GtnGlobal.op_sym.append("+")
			GtnGlobal.op_color[0].get_node("value").text = str(GtnGlobal.op_sym[0])
			GtnGlobal.num_values.append(num0)
			GtnGlobal.num_values.append(num1)
			
		1:
			num1 = (randi_range(2, 100))
			num0 = (randi_range(2, 100))+num1
			res1 = num0-num1
			GtnGlobal.op_sym.append("-")
			GtnGlobal.op_color[0].get_node("value").text = str(GtnGlobal.op_sym[0])
			GtnGlobal.num_values.append(num0)
			GtnGlobal.num_values.append(num1)
			
			
		_:
			print(" cant perfom first op ")
	print(num0 ,GtnGlobal.op_sym[0],  num1, "= ", res1)
	op = randi_range(0, 1)
	# + - x %
	match op:
		0:
			num2 = (randi_range(2, 100))
			res2 = num2+res1
			GtnGlobal.op_sym.append("+")
			GtnGlobal.op_color[1].get_node("value").text = str(GtnGlobal.op_sym[1])
			GtnGlobal.num_values.append(num2)
			GtnGlobal.num_values.append(res2)
		1:
			num2 = randi_range(1, res1)
			res2 = res1 - num2
			GtnGlobal.op_sym.append("-")
			GtnGlobal.op_color[1].get_node("value").text = str(GtnGlobal.op_sym[1])
			GtnGlobal.num_values.append(num2)
			GtnGlobal.num_values.append(res2)
		_:
			print(" cant perfom second op ")
	print(res1 , GtnGlobal.op_sym[1], num2, "= ", res2)
func _on_button_reset_pressed():
	display.color = display_color_normal
	GtnGlobal.pre_value = GtnGlobal.value
	GtnGlobal.value = 0
	display.get_node("value_display_value").text = str(GtnGlobal.value)
	next_lvl_values()
	start_timer(5)
	#start_timer()
	hide_num = randi_range(0, GtnGlobal.num_color.size()-1)
	print(" hide in " , hide_num)
	for i in range(0, GtnGlobal.num_color.size()):
		if i != hide_num:
			GtnGlobal.num_color[i].get_node("value").text = str(GtnGlobal.num_values[i])
		else:
			GtnGlobal.num_color[i].get_node("value").text = "__"
			
	print(GtnGlobal.num_values[0], GtnGlobal.op_sym[0], GtnGlobal.num_values[1], GtnGlobal.op_sym[1], GtnGlobal.num_values[2], " = ", GtnGlobal.num_values[3] )
func _on_keyboard_value_entered():
	
	display_color_normal = display.color 
	if(GtnGlobal.num_values[hide_num] == GtnGlobal.value):
		$Timer.stop()
		print("you got it right ", GtnGlobal.num_values[hide_num])
		print(" time ", time)
		print(" score ", time*5 +1)
		GtnGlobal.gtn_score = GtnGlobal.gtn_score + time*5 +1
		value_score.text = str(GtnGlobal.gtn_score)
		display.color = DarkTheme.green_l
		GtnGlobal.gtn_attmpt += 1
		print(GtnGlobal.gtn_attmpt)
		
	else:
		print("you got it wrong ", GtnGlobal.num_values[hide_num])
		display.color = DarkTheme.color4
		
		
	
func _on_timer_time_passed():
	if time > 0:
		time -= 1
		$Timer.start()
		$Timer/sec.text = str(time)
	else:
		$Timer.stop()
		
func start_timer(timer_limit:int):
	time = timer_limit
	$Timer.one_shot = true
	$Timer.start()
	

	
