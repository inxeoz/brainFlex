extends Node2D
var time:int
var color_node:ColorRect
signal sym_entered
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_a_pressed():
	for_each_b($Button_a/ColorRect, "+")

func _on_button_s_pressed():
	for_each_b($Button_s/ColorRect, "-")

func _on_button_m_pressed():
	for_each_b($Button_m/ColorRect, "x")


func _on_button_d_pressed():
	for_each_b($Button_d/ColorRect, "/")

func for_each_b(color_rect:ColorRect,str_type=""):
	color_node = color_rect
	color_rect.color = DarkTheme.color_on_click
	WosGlobal.sym_ent = str_type
	print(" value_ent ", WosGlobal.sym_ent)
	sym_entered.emit(WosGlobal.sym_ent)
	$Timer.start()

func _on_timer_timeout():
	color_node.color = DarkTheme.color_on_normal
	$Timer.stop()
	
