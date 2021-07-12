extends Node2D


var speed = 150



func _ready():
	set_physics_process(true)

func _physics_process(delta):
	global_position.x += speed * delta
	
	#print(self.get_name())
	
	#print (self.get_child_count())
	if (self.get_child_count() ==0):
		get_tree().change_scene("res://GameWave2.tscn")
	
	#if self.get_children():
	#	print("here")
	#	if is_in_group("Enemy"):
	#		pass
	#else:
	#	get_tree().change_scene("res://GameWave2.tscn")
	#	print("all dead")


