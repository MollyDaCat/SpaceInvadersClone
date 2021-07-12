extends KinematicBody2D

var speed = 400

func _ready():
	pass 

func _physics_process(delta):
	var collidedObject = move_and_collide(Vector2(0, speed * delta))
	if (collidedObject):
		
		#if collidedObject.is_in_group("enemy"):
		if "Enemy" in collidedObject.collider.name:
			global_position.y =+ 20
		elif "Player" in collidedObject.collider.name:
			collidedObject.get_collider().HIT()
			queue_free()
			GlobalVariables.EnemyBullets -= 1
		else:
			queue_free()
			GlobalVariables.EnemyBullets -= 1
