extends Node2D

#var damageplus = preload("res://Item/ItemD+.tscn")

var save_path = "user://save.dat"

#var damagemulti = preload("res://Item/Item.tscn")

#var rng

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $Layer1/HUD.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	print (str(GlobalVariables.WaveNumber))
	GlobalVariables.WaveNumber += 1
	#if GlobalVariables.WaveNumber == 2:
		#pass
	if GlobalVariables.WaveNumber >= 4:
		GlobalVariables.Finalscore += 100 * (0.5*(GlobalVariables.WaveNumber - 3))
	MainMusic.play_music() # Plays Music
	var data = [GlobalVariables.Highscore, GlobalVariables.Finalscore, GlobalVariables.TotalHits, GlobalVariables.HighWave]
	var file = File.new()
	var error = file.open(save_path, file.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
		print("!!Data Saved!!")
	else :
		get_tree().change_scene("res://Error Loading Scene.tscn")
	if GlobalVariables.WaveNumber > GlobalVariables.HighWave:
		GlobalVariables.Highwave = GlobalVariables.WaveNumber


func _on_Button_pressed(scene_to_load):
	print("changing scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load) # Changes scene through back button

func _physics_process(delta):
	if has_node("Enemies"): # Counts enemies
		pass
	else:
		get_tree().change_scene("res://GameWave2.tscn") # Reloads Scene
	if GlobalVariables.Finalscore > GlobalVariables.Highscore:
		GlobalVariables.Highscore = GlobalVariables.Finalscore
	if GlobalVariables.EnemyBullets < 0:
		GlobalVariables.EnemyBullets = 0 
	if GlobalVariables.TotalHits >= 50:
		GlobalVariables.ItemHealth = 1
	if GlobalVariables.WaveNumber >= 14:
		GlobalVariables.ItemDouble = 1
