extends Camera2D

var min_zoom=1.9
var max_zoom=4.9
var zoom_level= 1.0
var zoom_factor=0.1
var zoom_duration=0.2
var events={}
var last_drag_distance=0

func _ready():
	pass

func _unhandled_input(event):
			
	if event.is_action_pressed("zoom_in"):
		zoom_level = clamp(zoom_level - zoom_factor, min_zoom, max_zoom)
		zoom = Vector2(zoom_level, zoom_level)
		get_parent().get_node("Label").rect_scale=zoom

	if event.is_action_pressed("zoom_out"):
		zoom_level = clamp(zoom_level + zoom_factor, min_zoom, max_zoom)
		zoom = Vector2(zoom_level, zoom_level)
		get_parent().get_node("Label").rect_scale=zoom

