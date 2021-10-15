extends Node2D

var oldpolys
var newpolys
var oldcenters=[]
var newcenters=[]
signal move_complete
var drawpoly=false
var inc=0.0
var drawcenters=false
export var speed=0.02
export var bcolor:=Color(0, 0.4, 0.5, 1.0)
var transitions = ["draw_poly_with_lines"]#, "draw_move_along_lines"]#, "draw_poly_intersect"]

onready var current_transition=transitions[randi() % len(transitions)]

func _ready():
	set_process(false)

func _process(_delta):
	update()

func movecell(x):
	newcenters.append(x)
	update()

func _draw():
	#print('hanim draw', drawpoly, drawcenters)
	if drawpoly:
		inc=inc+speed
		inc=clamp(inc,0.0, 1.0)
		call(current_transition)
		#draw_poly_with_lines()
		#draw_move_along_lines()
		#draw_poly_intersect()
		if inc== 1.0:
			newpolys.clear()
			emit_signal("move_complete")
			inc=0.0
			drawpoly=false
			current_transition=transitions[randi() % len(transitions)]	
			set_process(false)
	if drawcenters:
		for i in newcenters:
			draw_circle(i, 3, Color.red)
		if len(newcenters) > len(newpolys):
			newcenters.clear()

func start(o, n):
	drawpoly=false
	oldpolys=o
	newpolys=n	
	# TODO right now keeping it simple assuming just using first old center - in future handle cases with more
	for i in oldpolys:
		oldcenters.append(i.loc)
	for i in newpolys:
		#$Tween.interpolate_method(self, "movecell", oldcenters[0], Vector2(i.loc[0], i.loc[1]), .8)	
		$Tween.interpolate_method(self, "movecell", oldcenters[0], i.loc, 1.0)
	drawcenters=true
	$Tween.start()

var todraw=[]
#This is run after the centers have been moved - only poly animation is now donw
func _on_Tween_tween_all_completed():
	drawcenters=false
	$Tween.remove_all()
	todraw.clear()
	oldcenters.clear()
	#print('city anim complete')
	set_process(true)
	for i in newpolys:
		#var t=Transform2D()
		var ddims=Vector2(i.loc[0],i.loc[1])
		var p1=i.node#.get_child(0)
		#t.origin=ddims
		#var m=t.xform(p1.polygon)
		var tmp={p=p1, origin=ddims} #m, origin=ddims}#i.node.position}
		todraw.append(tmp)
		#for pt in i.get_child(0).polygon:
			#$Tween.interpolate_method(self,"setpolys",i.position,i.position+pt,.1)
	#$Tween.start()
	drawpoly=true
	inc=0.0
	#update()

func draw_poly_with_lines():
	for i in todraw:
		for idx in range(1, i.p.size()):
			draw_line(i.origin.linear_interpolate(i.p[idx-1], inc) , 
			i.origin.linear_interpolate(i.p[idx], inc), bcolor , 4)
		draw_line(i.origin.linear_interpolate(i.p[i.p.size()-1], inc) , 
			i.origin.linear_interpolate(i.p[0], inc), bcolor , 4)

func draw_move_along_lines():
	for i in todraw:
		for idx in range(1, i.p.size()*inc):
			draw_line(i.p[idx-1] , i.p[idx], bcolor , 4)

class MyCustomSorter:
	static func sort_x(a, b):
		if a[0] < b[0]:
			return true
		return false

#TODO problem with merging is finding the interesection points among N polys
func draw_poly_intersect():
	var p1=todraw[0].p
#	var p2=todraw[1].p

#	var p=Geometry.intersect_polygons_2d(p1, p2)
#	for j in p.size():
#		for idx in range(1, p[j].size()*inc):
#			draw_line(p[j][idx-1] , p[j][idx], Color.darkblue , 4)

	for i in range(1, todraw.size()):
		var p2=todraw[i].p
		var p=Geometry.intersect_polygons_2d(p1, p2)
		for j in p.size():
			for idx in range(1, p[j].size()*inc):
				draw_line(p[j][idx-1] , p[j][idx], bcolor , 4)


#	var merge=todraw[0].p
#	for i in range(1,todraw.size()):
#		merge=Geometry.merge_polygons_2d(merge, todraw[i].p)
#	var p=[]
#	for j in merge.size():
#		for pts in merge[j]:
#			p.append(pts)
#	p.sort_custom(MyCustomSorter, 'sort_x')
#	var lastx=0
#	var lasty
#	for idx in range(1, p.size()*inc):
#		if abs(p[idx][0]-lastx) > 6:
#			draw_line(p[idx-1] , p[idx], Color.darkblue , 6)
#			lastx=p[idx][0]

#stop is called from main tree
func stop():
	inc=0.0
	drawcenters=false
	drawpoly=false
	newpolys.clear()
	oldpolys.clear()
	oldcenters.clear()
	newcenters.clear()
	todraw.clear()
	set_process(false)
	#current_transition=transitions[randi() % len(transitions)]	
	
