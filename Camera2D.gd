extends Camera2D
export (NodePath) var target

var min_zoom=1.0
var max_zoom=4.0
var zoom_level= 1.0
var zoom_factor=0.1
var zoom_duration=0.2
var events={}
var last_drag_distance=0
onready var tween: Tween = $Tween

func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		zoom_level = clamp(zoom_level - zoom_factor, min_zoom, max_zoom)
		zoom = Vector2(zoom_level, zoom_level)
#		tween.interpolate_property(self,"zoom",zoom,Vector2(zoom_level, zoom_level),
#		zoom_level, zoom_duration, tween.TRANS_LINEAR,
#		# Easing out means we start fast and slow down as we reach the target value.
#		tween.EASE_OUT)
		tween.start()
	if event.is_action_pressed("zoom_out"):
		zoom_level = clamp(zoom_level + zoom_factor, min_zoom, max_zoom)
		zoom = Vector2(zoom_level, zoom_level)
#		tween.interpolate_property(self,"zoom",zoom,Vector2(zoom_level, zoom_level),
#		zoom_level, zoom_duration, tween.TRANS_SINE,
#		# Easing out means we start fast and slow down as we reach the target value.
#		tween.EASE_OUT)
#		tween.start()
	if event is InputEventScreenDrag:
		events[event.index]=event
		if events.size() == 1:
			position+=event.relative.rotated(rotation) * zoom.x
