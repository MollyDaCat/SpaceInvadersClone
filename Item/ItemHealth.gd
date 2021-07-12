extends Node2D

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	if area.is_in_group("Player"):
		GlobalVariables.Health = GlobalVariables.Health * 2
		queue_free()
		print(GlobalVariables.Health)
