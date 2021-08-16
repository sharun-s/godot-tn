extends GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()# Replace with function body.

func reload(district):
	$VBoxContainer/imgbox.texture=load("res://"+district+".png")
	$VBoxContainer/NameBox.text=district
	show()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_BACKSPACE:
			hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
