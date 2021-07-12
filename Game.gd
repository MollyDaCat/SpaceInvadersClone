extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $Top/HUD.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	GlobalVariables.Finalscore = 0
	GlobalVariables.ShotsGame = 0
	GlobalVariables.BulletInstanceCount = 0
	GlobalVariables.WaveNumber += 0
	GlobalVariables.Damage = 1
	GlobalVariables.Multiplier = 0
	GlobalVariables.EnemyBullets = 0
	GlobalVariables.Health = 3
	GlobalVariables.DoubleShot = 0
	GlobalVariables.TotalShots = 3
	MainMusic.play_music()


func _on_Button_pressed(scene_to_load):
	print("changing scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)

func _physics_process(delta):
	#if get_children("enemies"):
		#is_in_group("Enemy").pass
		
	#else:
			#get_tree().change_scene("res://GameWave2.tscn")
	if GlobalVariables.Finalscore > GlobalVariables.Highscore:
		GlobalVariables.Highscore = GlobalVariables.Finalscore
	if GlobalVariables.BulletInstanceCount < 0:
		GlobalVariables.BulletInstanceCount = 0
	if GlobalVariables.EnemyBullets < 0:
		GlobalVariables.EnemyBullets = 0



	#if is_inside_tree():
		#if is_in_group("Enemy"):
			#pass
		#else:
			#get_tree().change_scene("Game")


