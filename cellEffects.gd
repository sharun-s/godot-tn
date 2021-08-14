extends Node2D

var oldpolys
var newpolys
var oldcenters=[]
var newcenters=[]
signal move_complete
var drawpoly=false
var inc=0.0
var drawcenters=false
var speed=0.01

func _process(_delta):
	update()

func movecell(x):
	newcenters.append(x)
	update()

func _draw():
	if drawpoly:
		inc=inc+speed
		inc=clamp(inc,0.0, 1.0)
		#draw_poly_with_lines()
		draw_move_along_lines()
		if inc== 1.0:
			newpolys.clear()
			emit_signal("move_complete")
			inc=0.0
			drawpoly=false			
	if drawcenters:
		for i in newcenters:
			draw_circle(i, 10, Color.red)
		if len(newcenters) > len(newpolys):
			newcenters.clear()

func start(o, n):
	drawpoly=false
	oldpolys=o
	newpolys=n	
	for i in oldpolys:
		oldcenters.append(i.loc)
	for i in newpolys:
		#$Tween.interpolate_method(self, "movecell", oldcenters[0], Vector2(i.loc[0], i.loc[1]), .8)	
		$Tween.interpolate_method(self, "movecell", oldcenters[0], i.loc, .8)
	drawcenters=true
	$Tween.start()

var todraw=[]
func _on_Tween_tween_all_completed():
	drawcenters=false
	$Tween.remove_all()
	todraw.clear()
	oldcenters.clear()
	for i in newpolys:
		#var t=Transform2D()
		var ddims=Vector2(i.loc[0],i.loc[1])
		var p1=i.node#.get_child(0)
		#t.origin=ddims
		#var m=t.xform(p1.polygon)
		var tmp={p=p1.polygon, origin=ddims} #m, origin=ddims}#i.node.position}
		todraw.append(tmp)
		#for pt in i.get_child(0).polygon:
			#$Tween.interpolate_method(self,"setpolys",i.position,i.position+pt,.1)
	#$Tween.start()
	drawpoly=true
	inc=0.0
	update()

func draw_poly_with_lines():
	for i in todraw:
		for idx in range(1, i.p.size()):
			draw_line(i.origin.linear_interpolate(i.p[idx-1], inc) , 
			i.origin.linear_interpolate(i.p[idx], inc), Color.black , 13)
			
func draw_move_along_lines():
	for i in todraw:
		for idx in range(1, i.p.size()*inc):
			draw_line(i.p[idx-1] , i.p[idx], Color.firebrick , 6)
