extends KinematicBody2D

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _colliding(area):
	if area.is_in_group("Player"):
		GlobalVariables.Multiplier += 0.5
		queue_free()
		print(GlobalVariables.Multiplier)
