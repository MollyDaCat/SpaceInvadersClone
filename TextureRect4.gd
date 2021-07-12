extends TextureRect

func _ready():
	hide()



func _on_Quit_mouse_entered():
	show()


func _on_Quit_mouse_exited():
	hide()
