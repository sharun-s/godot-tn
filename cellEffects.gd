extends Node2D

var oldpolys
var newpolys
var oldcenters=[]
var newcenters=[]
signal move_complete
var drawpoly=false

func _process(delta):
	update()

func movecell(x):
	newcenters.append(x)
	update()

var inc=0.0
func _draw():
	if drawpoly:
		inc=inc+.02
		inc=clamp(inc,0.0, 1.0)
		draw_poly_with_lines()
	else:
		for i in newcenters:
			draw_circle(i, 10, Color.red)
		if len(newcenters) > len(newpolys):
			newcenters.clear()

func start(o, n):
	drawpoly=false
	oldpolys=o
	newpolys=n	
	for i in oldpolys:
		oldcenters.append(i.node.position)
		
	for i in newpolys:
		$Tween.interpolate_method(self, "movecell", oldcenters[0], i.node.position, .8)	
	$Tween.start()

var todraw=[]
func _on_Tween_tween_all_completed():
	$Tween.remove_all()
	for i in newpolys:
		var t=Transform2D()
		var ddims=Vector2(i.loc[0],i.loc[1])
		print(i.node.position, ' ', ddims)
		var p1=i.node.get_child(0)
		t.origin=Vector2(ddims[0],ddims[1])
		var m=t.xform(p1.polygon)
		var tmp={p=m, origin=i.node.position}
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
			
