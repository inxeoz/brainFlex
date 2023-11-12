extends Node2D
@onready var value_num1 = $Button_num1/value_num1
@onready var value_score = $Button_score/value_score
var select_mode = load("res://select_mode/select_mode.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_back_pressed():
	get_tree().change_scene_to_packed(select_mode)
	
