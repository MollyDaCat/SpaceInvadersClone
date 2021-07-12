extends Button

func _ready():
	get_node("New Game").connect("hover", self, "_on_button_hover")

func _on_button_hover():
	get_node("1stImage")
