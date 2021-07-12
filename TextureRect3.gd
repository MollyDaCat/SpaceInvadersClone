extends TextureRect

func _ready():
	hide()



func _on_Options_mouse_entered():
	show()


func _on_Options_mouse_exited():
	hide()
