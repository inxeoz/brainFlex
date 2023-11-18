extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")
var time:int
var leng =0
var lib:Array
var res:int
var hidden_in:int
var num_ent_correctly_indexed = false
func _ready():
	reset()
	pass

func reset():
	num_ent_correctly_indexed = false
	lib = gen()
	res= cal_res(lib)
	leng = str(res).length()
	for val in lib:
		leng = max(leng, str(val).length())
	if leng< Global.leng_ele:
		print("--->", lib)
		print(res)
		impl_colon(lib[5])
		impl_sym(lib[3], lib[4])
		GtnGlobal.num_hidden_in = randi_range(0, 3)
		print("hidden in ", GtnGlobal.num_hidden_in)
		match GtnGlobal.num_hidden_in:
			0:
				GtnGlobal.hidden_num = lib[0]
				impl_num("", str(lib[1]), str(lib[2]), str(res))
			1:
				GtnGlobal.hidden_num = lib[1]
				impl_num(str(lib[0]), "", str(lib[2]), str(res))
			2:
				GtnGlobal.hidden_num = lib[2]
				impl_num(str(lib[0]), str(lib[1]), "", str(res))
			3:
				GtnGlobal.hidden_num = res
				impl_num(str(lib[0]), str(lib[1]), str(lib[2]), "")
		start_timer(10)
	else:
		reset()
func impl_colon(typ:int):
	if typ == 0:
			$box1/value.text = "("
			$box6/value.text = ")"
			$box4/value.text = ""
			$box9/value.text = ""
	elif lib[5] == 1:
			$box1/value.text = ""
			$box6/value.text = ""
			$box4/value.text ="("
			$box9/value.text = ")"
			
func impl_sym(sym1:String, sym2:String):
	$box3/value.text = sym1
	$box7/value.text = sym2
	
func impl_num(num1:String, num2:String, num3:String, num4:String):
	$box2/value.text = (num1)
	$box5/value.text = (num2)
	$box8/value.text = (num3)
	$box11/value.text = (num4)
func _process(delta):
	pass

func start_timer(time_limit:int):
	time = time_limit
	$Timer.one_shot = true
	$Timer.start()

func _on_timer_timeout():
	if time > 0:
		time -=1
		#print("time ----->", time)
		$Timer/sec.text = str(time).pad_zeros(2)
		$Timer.start()
	else:
		chat_box("time's up!, you'll get +1 score for choosing correcct symbol")
		$Timer.stop()
	
func correct_num_ent(input:int):
	if not num_ent_correctly_indexed:
			$Timer.stop()
			num_ent_correctly_indexed = true
			GtnGlobal.score += time * 2 + 1
			$score_color/value_score.text = str(GtnGlobal.score)
			match GtnGlobal.num_hidden_in:
				0:
					$box2/value.text = str(GtnGlobal.hidden_num)
				1:
					$box5/value.text =str(GtnGlobal.hidden_num)
				2:
					$box8/value.text = str(GtnGlobal.hidden_num)
				3:
					$box11/value.text =str(GtnGlobal.hidden_num)
			chat_box("you've got right, your score is : " +str( GtnGlobal.score) +"\n"+ "press reset for next round")
	else:
		chat_box("press reset for next round ")
func incorrect_num_ent():
	if not num_ent_correctly_indexed:
		chat_box("you've got wrong ")
	else:
		chat_box("press reset for next round ")
func randm():
	return randi_range(Global.min_range, Global.max_range)
	
func gen_t1(sym:Array):
	return [randm(), randm(), randm(), sym[0], sym[1], randi_range(0, 1)]
	
func gen_t2(sym:Array):
	var c = randm()
	if sym[0] == "/":
		var b = randm()
		var m = randm()
		print("m ---> ", m)
		print("c -->", c)
		print("b -->", b)
		return [b * c * m, b, c, sym[0], sym[1], 0]
	else :
		var n = randm()
		var x = randm()
		print("x-->", x)
		print("n -->", n)
		print("c -->", c)
		return [n*x, c*n, c, sym[0], sym[1], 1]
func gen():
	var symbls = ["+", "-", "x", "/"]
	var sym1 = symbls[randi_range(0, symbls.size()-1)]
	var sym2 = symbls[randi_range(0, symbls.size()-1)]
	if sym1 == "/" || sym2 == "/":
		return gen_t2([sym1, sym2])
	else:
		return gen_t1([sym1, sym2])
func cal_res(ele:Array):
	if ele[5] == 0:
		return operation(operation(ele[0], ele[1], ele[3]), ele[2], ele[4])
	else:
		return operation(ele[0], operation(ele[1], ele[2], ele[4]), ele[3])
func operation(num1:int, num2:int, sym:String):
	match sym:
		"+":
			return num1+num2
		"-":
			return num1- num2
		"x":
			return num1*num2
		"/":
			return num1/num2
func _on_button_reset_pressed():
	reset()

func _on_button_back_pressed():
	get_tree().change_scene_to_packed(select_mode)
	
func chat_box(msg:String):
	$chat_box.text = msg
#func make_it_ready():

func _on_keyboard_value_entered(input:String):
	if input.to_int() == GtnGlobal.hidden_num:
		correct_num_ent(input.to_int())
	else:
		incorrect_num_ent()
		
