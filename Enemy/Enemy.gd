extends KinematicBody2D

var attack = preload("res://EnemyBullet/EnemyBullet.tscn")

export(String) var scene_to_load

func _ready():
	$Area2D.connect("area_entered", self, "_colliding")
	get_node("BulletTimer").connect("timeout", self, "on_timer_timeout")

func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 20
		get_parent().speed = -150
	if area.is_in_group("left"):
		get_parent().global_position.y += 20
		get_parent().speed = 150
	if area.is_in_group("Bottom"):
		print("YOU LOSE!!!")
		get_tree().change_scene(scene_to_load)
	if area.is_in_group("Player"):
		print("YOU LOSE!!")
		get_tree().change_scene(scene_to_load)




var health = 1 * GlobalVariables.WaveNumber

func _physics_process(delta):
	if health <= 1:
		queue_free()

func on_timer_timeout():
	if GlobalVariables.EnemyBullets < 8:
		var Shot = attack.instance()
		Shot.position = Vector2(global_position.x, global_position.y -20)
		get_tree().get_root().add_child(Shot)
		GlobalVariables.EnemyBullets += 1






func hit():
	health -= GlobalVariables.Damage * (GlobalVariables.Multiplier + 1)
	#print (health)
