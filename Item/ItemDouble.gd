extends Node2D

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	if area.is_in_group("Player"):
		GlobalVariables.total = 1
		GlobalVariables.TotalHits = GlobalVariables.TotalHits * 2
		queue_free()
		print("DoubleShot")
