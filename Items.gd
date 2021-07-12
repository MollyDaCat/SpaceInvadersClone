extends Node2D

var damagemulti = preload("res://Item/ItemMulti.tscn")

var damageplus = preload("res://Item/ItemD+.tscn")

var itemhealth = preload("res://Item/ItemHealth.tscn")

var doubleshot = preload("res://Item/ItemDouble.tscn")

var rng

var Items = [3, 5, 7, 9, 11, 13, 15]

func _ready():
	randomize()
	if Items.has(GlobalVariables.WaveNumber):
		rng = round(rand_range(1,10))
		if rng == [1,2,3] :
			print ("Multif")
			var damagemultiinstance = damagemulti.instance()
			damagemultiinstance.position = Vector2(1200,650)
			get_tree().get_root().add_child(damagemultiinstance)
			print(damagemultiinstance.get_name())
		if rng == [4,5,6] :
		#else my_random_number <0.49:
			print ("Addition")
			var damageplusinstance = damageplus.instance()
			damageplusinstance.position = Vector2(1200,650)
			get_tree().get_root().add_child(damageplusinstance)
		if rng == [7,8] :
			if GlobalVariables.ItemHealth == 1:
				print ("health")
				var itemhealthinstance = itemhealth.instance()
				itemhealthinstance.position = Vector2(1200,650)
				get_tree().get_root().add_child(itemhealthinstance)
				print(itemhealthinstance.get_name())
			else:
				print ("Multif")
				var damagemultiinstance = damagemulti.instance()
				damagemultiinstance.position = Vector2(1200,650)
				get_tree().get_root().add_child(damagemultiinstance)
				print(damagemultiinstance.get_name())
		if rng == [9,10] : 
			if GlobalVariables.ItemDouble == 1 :
				print ("DAMAGE")
				var doubleshotinstance = doubleshot.instance()
				doubleshotinstance.position = Vector2(1200,650)
				get_tree().get_root().add_child(doubleshotinstance)
				print(doubleshotinstance.get_name())
			else: 
				print ("Multif")
				var damageplusinstance = damageplus.instance()
				damageplusinstance.position = Vector2(1200,650)
				get_tree().get_root().add_child(damageplusinstance)
				print(damageplusinstance.get_name())
