extends Node2D

var RoomMusic = load("res://Music/250856__joshuaempyre__epic-orchestra-loop.wav")

func _ready():
	pass


func play_music():
	$Music.stream = RoomMusic
	$Music.play()

func stop_music():
	$Music.stop()

