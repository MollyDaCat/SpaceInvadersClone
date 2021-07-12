extends Node2D

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	if area.is_in_group("Player"):
		GlobalVariables.Damage += 2
		queue_free()
		print(GlobalVariables.Damage)
