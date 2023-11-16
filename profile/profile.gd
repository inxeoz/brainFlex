extends Node2D
var start_menu = load("res://start_menu/start_menu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$attempts_value.text = str(Global.attempts)
	if Global.hint_status_on:
		$hint_status_value.text ="on"
	else:
		$hint_status_value.text = "off"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_back_pressed():
	get_tree().change_scene_to_packed(start_menu);
