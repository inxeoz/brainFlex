extends Node2D
var select_mode = load("res://select_mode/select_mode.tscn")
@onready var display = $keyboard/color_display
var display_color_normal:Color = DarkTheme.color5
var hide_num:int
var time = 0
@onready var value_score = $score_color/value_score
var num0:int
var num1:int
var num2:int
var num3:int
var res1:int
var res2:int

# Called when the node enters the scene tree for the first time.
func _ready():
    GtnGlobal.color_nodes.append($box1)
    GtnGlobal.color_nodes.append($box2)
    GtnGlobal.color_nodes.append($box3)
    GtnGlobal.color_nodes.append($box4)
    GtnGlobal.color_nodes.append($box5)
    GtnGlobal.color_nodes.append($box6)
    _on_button_reset_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_button_back_pressed():
    get_tree().change_scene_to_packed(select_mode)
    
func next_lvl_values():
    var values = gen_values()
    GtnGlobal.box_values[0] = values[0]
    GtnGlobal.box_values[1] = values[1]
    GtnGlobal.box_values[2] = values[2]
    values = gen_values(values[3].to_int())
    GtnGlobal.box_values[3] = values[1] # because second time the 0th index value
    # is actually a result not operends
    GtnGlobal.box_values[4] = values[2]
    GtnGlobal.box_values[5] = values[3]
    print(GtnGlobal.box_values)
    
func gen_values(res = -1):
    var op_type = randi_range(0, 1)
    match op_type:
        0:
            num1 = randi_range(Global.min_range, Global.max_range)
            num2 = randi_range(Global.min_range, Global.max_range)
            return [str(num1) , "+",str(num2), str(num1+num2)]
            
        1:
            if res==-1:
                num2 = randi_range(Global.min_range, Global.max_range)
                num1 = randi_range(Global.min_range, Global.max_range)+num2
                return [str(num1), "-", str(num2), str(num1-num2)]
            else:
                num1 = randi_range(1, res)
                return [str(res), "-" , str(num1), str(res-num1)]
    
func _on_button_reset_pressed():
    display.color = display_color_normal
    GtnGlobal.pre_value = GtnGlobal.value
    GtnGlobal.value = 0
    display.get_node("value_display_value").text = str(GtnGlobal.value)
    next_lvl_values()
    start_timer(5)
    
    hide_num = randi_range(0, GtnGlobal.color_nodes.size())
    for i in range(0, GtnGlobal.color_nodes.size()):
        if i != hide_num:
            GtnGlobal.color_nodes[i].get_node("value").text = GtnGlobal.box_values[i]
        else:
            GtnGlobal.color_nodes[i].get_node("value").text = "__"
func _on_keyboard_value_entered():
    display_color_normal = display.color 
    if GtnGlobal.box_values[hide_num] == str(GtnGlobal.value):
        $Timer.stop()
        print("you got it right ", GtnGlobal.box_values[hide_num])
        print(" time ", time)
        print(" score ", time*5 +1)
        GtnGlobal.gtn_score = GtnGlobal.gtn_score + time*5 +1
        value_score.text = str(GtnGlobal.gtn_score)
        display.color = DarkTheme.green_l
        GtnGlobal.gtn_attmpt += 1
        print(GtnGlobal.gtn_attmpt)
        
    else:
        print("you got it wrong ", GtnGlobal.box_values[hide_num])
        display.color = DarkTheme.color4
        
        
    
func start_timer(timer_limit:int):
    time = timer_limit
    $Timer.one_shot = true
    $Timer.start()
    
func _on_timer_timeout():
    if time > 0:
        time -= 1
        $Timer.start()
        $Timer/sec.text = str(time)
    else:
        $Timer.stop()
