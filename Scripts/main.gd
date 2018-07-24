extends Node

# class member variables go here, for example:
# var a = 2
var p = global.points

func _ready():
	check_pts()
	get_node("TouchScreenButton").connect("pressed",self,"_on_button_pressed")
	print("points" , p)
	get_node("Planet/Tween").interpolate_property(get_node("./Planet"), 'visibility/opacity' , 0 , 1 , 3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	get_node("Planet/Tween").start()
	get_node("ProgressBar").set_value(global.tot_points)

func check_pts():
	if p >= 0 and p <= 10:
		get_node("Planet").set_animation("0")
		
	elif p > 10 and p <= 20:
		get_node("Planet").set_animation("1")
		
	elif p > 20 and p <= 30:
		get_node("Planet").set_animation("2")
		
	elif p > 30 and p <= 40:
		get_node("Planet").set_animation("3")
		
	elif p > 40:
		get_node("Planet").set_animation("4")
		
	get_node("/root/global").save(global.tot_points, global.points)

func _on_button_pressed():
	get_tree().change_scene("res://Scenes/log.tscn")
