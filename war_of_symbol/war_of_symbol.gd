extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")
var time:int
var leng =0
var lib:Array
var res:int
var hidden_in:int# Called when the node enters the scene tree for the first time.
func _ready():
	_on_button_reset_pressed()
	pass

func reset(hide_in=-1):
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
		else:
			$box1/value.text = ""
			$box6/value.text = ""
			$box4/value.text ="("
			$box9/value.text = ")"
		$box2/value.text = str(lib[0])
		$box5/value.text = str(lib[1])
		$box8/value.text = str(lib[2])
		if hide_in == 0:
			WosGlobal.hidden_sym = lib[3]
			$box3/value.text = ""
		else:
			WosGlobal.hidden_sym = lib[4]
			$box7/value.text = ""
		$box11/value.text = str(res)
	else:
		_on_button_reset_pressed()
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
		print("time ", time)
		$Timer.start()
	else:
		$Timer.stop()
	
func _on_keyboard_sym_entered(sym:String):
	if sym == WosGlobal.hidden_sym:
		print(" you've got right ", sym)
	else:
		print(" you've got wrong ")
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
	WosGlobal.sym_hidden_in = randi_range(0, 1)
	reset(hidden_in)
