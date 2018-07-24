extends Node2D

# class member variables go here, for example:
# var a = 2

var arr = ["t0" , "t1" , "t2" , "t3" , "t4" , "t5"] 

var d = { 
	"t0" : [2,2],
	"t1" : [5,4],
	"t2" : [5,2],
	"t3" : [3,4],
	"t4" : [5,2],
	"t5" : [2,4],
	}

func _ready():
	
	get_node("back").connect("pressed",self,"_back_pressed")
	
	for i in arr:
		get_node(str(i)).connect("pressed",self,"_btn_pressed", [str(i)])
	




func _btn_pressed(btn_nr):
	print(btn_nr)
	global.points += d[btn_nr][0]
	global.tot_points += d[btn_nr][0]
	print(global.points)
	

func _back_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")