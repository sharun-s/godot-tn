extends GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()# Replace with function body.

func reload(district):
	$VBoxContainer/PanelContainer/imgbox.texture=load("res://"+district+".png")
	$VBoxContainer/NameBox.text=district
	show()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_BACKSPACE:
			hide()

func _on_Back_pressed():
	hide()
