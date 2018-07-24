extends Node

# class member variables go here, for example:
# var a = 2
var points = 0


var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {"highscore": 0, "curr_score" : 0} #variable to store data
var tot_points = save_data["highscore"]

func read_savegame():
	savegame.open(save_path, File.READ) #open the file
	save_data = savegame.get_var() #get the value
	savegame.close() #close the file
	points = save_data["curr_score"]
	tot_points = save_data["highscore"]

func _ready():
	if not savegame.file_exists(save_path):
		create_save()
	set_process(true)

func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()

func save(tot_points, points):
	save_data["highscore"] = tot_points #data to save
	save_data["curr_score"] = points #data to save
	savegame.open(save_path, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file
