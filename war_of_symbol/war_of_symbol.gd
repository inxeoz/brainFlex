extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")
var time:int
var leng =0
var lib:Array
var res:int
var hidden_in:int
var sym_ent_correctly_indexed = false
func _ready():
	make_it_ready()
	reset()
	pass

func reset():
	make_it_ready()
	sym_ent_correctly_indexed = false
	lib = gen()
	res= cal_res(lib)
	leng = str(res).length()
	for val in lib:
		leng = max(leng, str(val).length())
		print("leng ", leng)
	if leng< Global.leng_ele:
		
		print("--->", lib)
		print(res)
		if lib[5] == 0:
			$box1/value.text = "("
			$box6/value.text = ")"
			$box4/value.text = ""
			$box9/value.text = ""
		elif lib[5] == 1:
			$box1/value.text = ""
			$box6/value.text = ""
			$box4/value.text ="("
			$box9/value.text = ")"
		$box2/value.text = str(lib[0])
		$box5/value.text = str(lib[1])
		$box8/value.text = str(lib[2])
		WosGlobal.sym_hidden_in = randi_range(0, 1)
		if WosGlobal.sym_hidden_in== 0:
			WosGlobal.hidden_sym = lib[3]
			$box3/value.text = ""
			$box7/value.text = lib[4]
			$box3.color = GlobalTheme.highlight_easy_lvl3
		else:
			WosGlobal.hidden_sym = lib[4]
			$box3/value.text = lib[3]
			$box7/value.text = ""
			$box7.color = GlobalTheme.highlight_easy_lvl3
		$box11/value.text = str(res)
		start_timer(10)
	else:
		reset()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_timer(time_limit:int):
	time = time_limit
	$Timer.one_shot = true
	$Timer.start()

func _on_timer_timeout():
	if time > 0:
		time -=1
		print("time ----->", time)
		$Timer/sec.text = str(time).pad_zeros(2)
		$Timer.start()
	else:
		chat_box("time's up!, you'll get +1 score for choosing correcct symbol")
		$Timer.stop()
	
func _on_keyboard_sym_entered(sym:String):
	if sym == WosGlobal.hidden_sym:
		correct_sym_ent(sym)
	else:
		incorrect_sym_ent()
		
func correct_sym_ent(sym:String):
	if not sym_ent_correctly_indexed:
			$Timer.stop()
			sym_ent_correctly_indexed = true
			WosGlobal.score += time * 2 + 1
			$score_color/value_score.text = str(WosGlobal.score)
			if WosGlobal.sym_hidden_in== 0:
				$box3/value.text = sym
				$box3.color = GlobalTheme.highlight_easy_lvl1
			else:
				$box7/value.text = sym
				$box7.color = GlobalTheme.highlight_easy_lvl1
			chat_box("you've got right, your score is : " +str( WosGlobal.score) +"\n"+ "press reset for next round")
	else:
		chat_box("press reset for next round ")
func incorrect_sym_ent():
	if not sym_ent_correctly_indexed:
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
func make_it_ready():
	$Color_bg.color= GlobalTheme.color_bg
	
	$Button_back/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	$Button_back/ColorRect.color = GlobalTheme.color_on_click
	
	$Button_reset/ColorRect.color = GlobalTheme.color_on_click
	$Button_reset/RichTextLabel.add_theme_color_override("default_color", GlobalTheme.white)
	
	$score_color.color = GlobalTheme.highlight_dim_lvl2
	$score_color/score_text.add_theme_color_override("default_color", GlobalTheme.white)
	$score_color/value_score.add_theme_color_override("default_color", GlobalTheme.white)
	
	$Timer/sec.add_theme_color_override("default_color", GlobalTheme.white)
	
	$box1.color = GlobalTheme.highlight_easy_lvl1
	$box1/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box2.color = GlobalTheme.highlight_easy_lvl1
	$box2/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box3.color = GlobalTheme.highlight_easy_lvl1
	$box3/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box4.color = GlobalTheme.highlight_easy_lvl1
	$box4/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box5.color = GlobalTheme.highlight_easy_lvl1
	$box5/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box6.color = GlobalTheme.highlight_easy_lvl1
	$box6/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box7.color = GlobalTheme.highlight_easy_lvl1
	$box7/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box8.color = GlobalTheme.highlight_easy_lvl1
	$box8/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box9.color = GlobalTheme.highlight_easy_lvl1
	$box9/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box10.color = GlobalTheme.highlight_easy_lvl1
	$box10/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	$box11.color = GlobalTheme.highlight_easy_lvl1
	$box11/value.add_theme_color_override("default_color", GlobalTheme.black)
	
	#keyboards keys
	$keyboard/Button_a/value.add_theme_color_override("default_color", GlobalTheme.black)
	$keyboard/Button_a/ColorRect.color = GlobalTheme.highlight_easy_lvl2
	
	$keyboard/Button_s/value.add_theme_color_override("default_color", GlobalTheme.black)
	$keyboard/Button_s/ColorRect.color = GlobalTheme.highlight_easy_lvl2
	
	$keyboard/Button_m/value.add_theme_color_override("default_color", GlobalTheme.black)
	$keyboard/Button_m/ColorRect.color = GlobalTheme.highlight_easy_lvl2
	
	$keyboard/Button_d/value.add_theme_color_override("default_color", GlobalTheme.black)
	$keyboard/Button_d/ColorRect.color = GlobalTheme.highlight_easy_lvl2
	
	$chat_box.add_theme_color_override("default_color", GlobalTheme.white)
	
