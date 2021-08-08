extends Camera2D

var min_zoom=1.9
var max_zoom=3.3
var zoom_level= 1.0
var zoom_factor=0.1
var zoom_duration=0.2
var events={}
var last_drag_distance=0
onready var tween: Tween = $Tween
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _unhandled_input(event):
#	if event is InputEventScreenTouch:
#		if event.pressed:
#			events[event.index]=event
#		else:
#			events.erase(event.index)
				
	if event.is_action_pressed("zoom_in"):
		zoom_level = clamp(zoom_level - zoom_factor, min_zoom, max_zoom)
		zoom = Vector2(zoom_level, zoom_level)
		get_parent().get_node("Label").rect_scale=zoom
#		tween.interpolate_property(self,"zoom",zoom,Vector2(zoom_level, zoom_level),
#		zoom_level, zoom_duration, tween.TRANS_LINEAR,
#		# Easing out means we start fast and slow down as we reach the target value.
#		tween.EASE_OUT)
		#tween.start()
	if event.is_action_pressed("zoom_out"):
		zoom_level = clamp(zoom_level + zoom_factor, min_zoom, max_zoom)
		zoom = Vector2(zoom_level, zoom_level)
		get_parent().get_node("Label").rect_scale=zoom
#		tween.interpolate_property(self,"zoom",zoom,Vector2(zoom_level, zoom_level),
#		zoom_level, zoom_duration, tween.TRANS_SINE,
#		# Easing out means we start fast and slow down as we reach the target value.
#		tween.EASE_OUT)
#		tween.start()
#	if event is InputEventScreenDrag:
#		events[event.index]=event
#		#if events.size() == 1:
#		#	position+=event.relative.rotated(rotation) * zoom.x
#		#	position.x=clamp(position.x, 0, screen_size.x)
#		#	position.y=clamp(position.y, -200, screen_size.y+200)
#		if events.size() == 2:
#			var ekeys=events.keys()
#			var drag_distance=events[ekeys[1]].position.distance_to(events[ekeys[0]].position)
#			print(drag_distance)
#			if abs(drag_distance - last_drag_distance) > 10: #sensitivity
#				var new_zoom=(1+zoom_factor) if drag_distance < last_drag_distance else (1-zoom_factor)
#				zoom_level = clamp(new_zoom, min_zoom, max_zoom)
#				zoom = Vector2(zoom_level, zoom_level)
#				last_drag_distance=drag_distance
