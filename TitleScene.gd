extends Control


var save_path = "user://save.dat"

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $"Menu/Middle Section/Game Modes/Scene".get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	GlobalVariables.WaveNumber = 1
	MainMusic.stop_music()
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			if GlobalVariables.Test == 0:
				if player_data[0] > GlobalVariables.Highscore:
					GlobalVariables.Highscore = player_data[0]
				if player_data[1] > GlobalVariables.Finalcore:
					GlobalVariables.Finalscore = player_data[1]
				if player_data[2] > GlobalVariables.TotalHits:
					GlobalVariables.TotalHits = player_data[2]
				if player_data[3] > GlobalVariables.HighWave:
					GlobalVariables.HighWave = player_data[3]
				if player_data[4] > GlobalVariables.ItemDouble:
					GlobalVariables.ItemDouble = player_data[4]
				GlobalVariables.Test += 1
			else : 
				pass
		else:
			get_tree().change_scene("res://Error Loading Data.tscn")
	
	
	
	

func _on_Button_pressed(scene_to_load):
	print("changing scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)

