extends TextureRect

func _ready():
	hide()



func _on_New_Game_mouse_entered():
	show()
	


func _on_New_Game_mouse_exited():
	hide()
