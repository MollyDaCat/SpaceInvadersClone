extends Node2D

var save_path = "user://save.dat"

func _ready():
	for button in $"Alignment X/Alignment Y/Buttons".get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	GlobalVariables.WaveNumber = 1
	MainMusic.stop_music()
	
	var data = [GlobalVariables.Highscore, GlobalVariables.Finalscore,GlobalVariables.ItemHealth, GlobalVariables.HighWave, GlobalVariables.ItemDouble]
	var file = File.new()
	var error = file.open(save_path, file.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
		print("!!Data Saved!!")
	else :
		get_tree().change_scene("res://Error Loading Scene.tscn")


func _on_Button_pressed(scene_to_load):
	print("changing scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
	GlobalVariables.WaveNumber = 1
	


