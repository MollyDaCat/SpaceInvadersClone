extends KinematicBody2D

var bullet = preload("res://Bullet/Bullet.tscn")

export var speed = 100

export(String) var scene_to_load

var Health = GlobalVariables.Health

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		#spawn a bullet
		if GlobalVariables.BulletInstanceCount < 3:
			var bulletinstance = bullet.instance()
			bulletinstance.position = Vector2(position.x, position.y -20)
			get_tree().get_root().add_child(bulletinstance)
			GlobalVariables.ShotsGame +=1
		
		else:
			pass
	if GlobalVariables.Health <= 0:
		get_tree().change_scene(scene_to_load)


func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -speed * delta))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, speed * delta))



func _colliding(area):
	if area.is_in_group("left"):
		print ("left")
		position.x=35
	if area.is_in_group("right"):
		print ("right")
		position.x=1242
	if area.is_in_group("Top"):
		print("Top")
		position.y=20

func HIT():
	GlobalVariables.Health -= 1
	$Timer.start()
	GlobalVariables.TotalHits += 1

func _not_colliding(area):
	pass


func _on_Timer_timeout():
	GlobalVariables.Health += 1
	print("Gain")
