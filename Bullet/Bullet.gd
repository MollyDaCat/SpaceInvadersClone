extends KinematicBody2D

var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.BulletInstanceCount += 1
	set_physics_process(true)



func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, -speed * delta))
	if (collidedObject):
		
		#if collidedObject.is_in_group("enemy"):
		if "Enemy" in collidedObject.collider.name:
			collidedObject.get_collider().hit()
			GlobalVariables.Finalscore += 10
			#print ("Score +10")
		queue_free()
		GlobalVariables.BulletInstanceCount -= 1



