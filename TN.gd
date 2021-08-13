extends Node2D

# generated using inkscape --query-all tndistricts.svg
var d={
	Ariyalur=[953.4,772.77154],
	Chengalpattu=[1187.6992,250.59959],
	Chennai=[1346.5329,127.77688],
	Coimbatore=[176.59072,778.52605],
	Cuddalore=[930,608],
	Dharmapuri=[523.4,391.98666],
	Dindigul=[378.9,976.16227],
	Erode=[239.74398,586.9],
	Kallakurichi=[845.71773,541.92189],
	Kanchipuram=[1159.6992,209.4353],
	Kanyakumari=[318.8,1749.4],
	Karur=[548.7041,882.19391],
	Krishnagiri=[447.84352,264.0834],
	Madurai=[448.7,1155.6],
	Mayiladithurai=[1147.2,766.3],
	Nagapattinam=[1190.8322,941.2],
	Namakkal=[525.9,710.24797],
	Nilgiris=[35.179205,666.66965],
	Perumbalur=[849.59825,736.1],
	Pudukotai=[784,1010.1992],
	Ramanathapuram=[711.41374,1277.6],
	Ranipet=[1035.4198,153.59961],
	Salem=[510.87492,581.5356],
	Sivagangai=[670.3,1117.9],
	Tenkasi=[342.68731,1464.2479],
	Thanjavur=[892.9,849.9625],
	Theni=[349.98068,1189.1748],
	Thoothukudi=[524.26323,1477.0951],
	Tiruchirapalli=[687.5,771.2813],
	Tirunelveli=[342.5811,1598.9395],
	Tirupathur=[769.5,237.28516],
	Tiruppur=[295.39381,797.44396],
	Tiruvallur=[1066.8503,31.7],
	Tiruvannamalai=[844.8954,260.51825],
	Tiruvarur=[1067.9132,907.08195],
	Vellore=[833.79688,171.82608],
	Vilippuram=[1042.3355,412.88469],
	Virudhunagar=[406.3,1340.1006]
}

var score=0
var attempts=0
var turns=10
var game_in_progress=0
var rng=RandomNumberGenerator.new()

var challenge:=''
var selected_district:=''
var selected_color:=Color.darkorange
var deselect_color:=Color.lightyellow#Color("eeffcc88")
var selected_color_right:=Color.lightgreen
var selected_color_wrong:=Color.lightcoral
var district_label_text_color:=Color('f6b016')
var border_color=Color.black#Color.firebrick
var border_width:=2
var border_width_highlight:=5
var tw:=Tween.new()
var walkpath:=Line2D.new()

func revert_transform(poly:Polygon2D):
	if poly.transform != Transform2D.IDENTITY:
		var transformed_polygon = poly.transform.xform(poly.polygon)
		poly.transform = Transform2D.IDENTITY
		poly.polygon = transformed_polygon
		return poly

func merge_poly(history_item):
	var g=history_item[0]
	var clr=history_item[1]
	var main:Polygon2D=Polygon2D.new()
	var t=Transform2D()
	var ddims=d[g[0]]
	var p1=get_node(g[0]).get_child(0)
	t.origin=Vector2(ddims[0],ddims[1])
	var m
	if g.size()==1:
		m=t.xform(p1.polygon)
		main.polygon=m
	else:
		var t2=Transform2D()	
		ddims=d[g[1]]
		var p2=get_node(g[1]).get_child(0)
		t2.origin=Vector2(ddims[0],ddims[1])
		m=Geometry.merge_polygons_2d(t.xform(p1.polygon), 
										t2.xform(p2.polygon) )
		main.polygon=m[0]
		#debug
		#var test=main.duplicate()
		#test.color=Color.blueviolet
		#add_child(test)
		for i in range(2,len(g)):
			ddims=d[g[i]]
			t.origin=Vector2(ddims[0],ddims[1])
			var tp=t.xform(get_node(g[i]).get_child(0).polygon)
			m=Geometry.merge_polygons_2d(main.polygon, tp)
			main.polygon=m[0]
			#debug
	#		#test=main.duplicate()
			#test.color=Color(rng.randi_range(70,200))
			#add_child(test)
			#cnt=cnt+1
		#main.color=Color(rng.randf_range(0.6,1.0), rng.randf_range(0.0,1.0), rng.randf_range(0.0,0.26))
	main.color=clr
	#Color(rng.randf_range(0.1,0.54), rng.randf_range(0.3,0.8), rng.randf_range(0.2,0.91))
	return main
	
var compass_colors={
	North=[Color.orange,'N'],
	South=[Color.violet, 'S'],
	East=['00bb99', 'E'],
	West=["0099bb", 'W']
}

func hide_compass():
	$HUD/E.hide()
	$HUD/N.hide()
	$HUD/W.hide()
	$HUD/S.hide()

func show_compass():
	$HUD/E.show()
	$HUD/N.show()
	$HUD/W.show()
	$HUD/S.show()

func _compass_toggled(pressed, dir):
	if game_in_progress==0:
		if pressed:
			get_node("HUD/"+compass_colors[dir][1])['modulate']=compass_colors[dir][0]
			get_tree().set_group(dir, 'modulate', compass_colors[dir][0])
		else:
			get_node("HUD/"+compass_colors[dir][1])['modulate']=Color(1.0,1.0,1.0)
			get_tree().set_group(dir, 'modulate', Color(1.0,1.0,1.0))
		
func create_polygons(s:Sprite):
	var b=BitMap.new()
	b.create_from_image_alpha(s.texture.get_data())
	var rect=Rect2(0, 0, s.texture.get_width(), s.texture.get_height())
	var polys=b.opaque_to_polygons(rect)
	var p=Polygon2D.new()
	var c=CollisionPolygon2D.new()
	var shape
	if s.texture.resource_path=="res://Tirupathur.png":
		shape=polys[1]
	elif s.texture.resource_path=="res://Tirunelveli.png":
		shape=PoolVector2Array()
		var pts=[ -128.8, -138.5, -128, -138.5, -101, -103.5, -99, -103.5, -54, -105.5, -54, -103.3, -46, -95.3, -46, -92.8, -42.7, -85.5, -30.3, -75.5, -28.2, -75.5, -21.3, -90.5, -15.8, -90.5, 7, -86, 16, -103, 16, -104.8, 7.60001, -114.1, 8.7, -116.5, 9.89999, -116.5, 18.8, -132.5, 22.6, -132.5, 33.6, -125.5, 41, -125.5, 69, -124.5, 69, -122.4, 92, -101.4, 92, -99, 106, -79.1, 106, -73.7, 95, -61.6, 95, -55.5, 98.3, -30.5, 96.4, -30.5, 86.7, -5.7, 95.3, 13.5, 96, 13.5, 105, 24.8, 105, 47.9, 112, 58.9, 112, 63.8, 109.5, 71.2, 119.7, 79.5, 138, 79.5, 138, 90.5, 115.6, 104.5, 113.4, 104.5, 89, 115.7, 85.5, 128.5, 83.7, 128.5, 66.7, 142.5, 63, 142.5, 23.9, 151.5, -6.5, 151.5, -8, 150.9, -8, 149.6, -11, 147.6, -11, 134.5, -12.1, 118.5, -9.3, 118.5, 1.3, 113.9, -12, 92.1, -12, 88.5, -13.8, 72.4, -27, 70.2, -27, 68.5, -35, 62.5, -35, 58.5, -36.8, 46.5, -44, 37.2, -44, 30.3, -44.8, 29.5, -47.3, 29.5, -72, 20.9, -72, 19.7, -103, 3.7, -103, 2.2, -125, -22.7, -125, -25, -138, -47, -138, -53.4, -125, -64.4, -125, -66, -116.2, -82.5, -114.8, -82.5, -109, -88.3, -109, -89.7, -107.4, -96.8, -111.3, -105.5, -111.9, -105.5, -138, -137.4, -138, -151.5, -135.8, -151.5 ]
		for i in range(0,len(pts),2):
			shape.append(Vector2(pts[i]+137,pts[i+1]+151))
	else:
		shape=polys[0]
	p.polygon=shape
	p.position=s.position - Vector2(s.texture.get_width()/2.0,s.texture.get_height()/2.0)
	p.color=deselect_color
	c.polygon=shape
	c.position=s.position - Vector2(s.texture.get_width()/2.0,s.texture.get_height()/2.0)
	return [c, p]

#var shore:ShaderMaterial
#func applyshore(district):
#	var dp:Polygon2D=get_node(district).get_child(0)
#	dp.material=shore

func _ready():
	init_label_font()
	#shore=ShaderMaterial.new()
	#shore.shader=load("res://shore.shader")
	rng.randomize()
	add_child(tw)
	add_child(walkpath)
	VisualServer.set_default_clear_color('001f3f')#Color("ff222222"))
	for district in d.keys():
		var a2d=Area2D.new()
		var x=d[district][0]
		var y=d[district][1]
		var s=Sprite.new()
		var image=load("res://"+district+".png")
		s.texture=image
		var w=s.texture.get_width()
		var h=s.texture.get_height()
		d[district].append(w)
		d[district].append(h)
		var polys=create_polygons(s)
		a2d.add_child(polys[1])
		a2d.add_child(polys[0])
		a2d.name=district
		a2d.show_behind_parent=true
		a2d.position=Vector2(x+(w/2),y+(h/2))
		add_child(a2d)
		add_label(district, x, y, w, h, "dlabels")
		a2d.connect('input_event', self, 'on_district_select',[district])
	$HUD/N.connect("toggled", self, "_compass_toggled", ["North"])
	$HUD/S.connect("toggled",self, "_compass_toggled", ["South"])
	$HUD/E.connect("toggled",self, "_compass_toggled", ["East"])
	$HUD/W.connect("toggled",self, "_compass_toggled", ["West"])
	$Camera2D.position=get_node('Karur').position
	$Camera2D/Gopal.position=Vector2(-1*get_viewport().size.x/2+50,0)
	$Camera2D.zoom=Vector2(2.4, 2.4)
	$Label.rect_scale=$Camera2D.zoom


var dhistory=[{
	Salem=[['Salem', 'Dharmapuri', 'Namakkal', 'Krishnagiri'],Color.mediumspringgreen],
	Coimbatore=[['Tiruppur', 'Coimbatore', 'Erode'], Color.darkgreen],#006400
	Madurai=[['Madurai', 'Dindigul', 'Theni'], Color.lightgreen],#90ee90
	Ramanathapuram=[['Ramanathapuram', 'Sivagangai','Virudhunagar'], Color('fffa90')], #fffacd
	Tirunelveli=[['Tirunelveli', 'Thoothukudi', 'Tenkasi'], Color.honeydew],#f0fff0
	"North Arcot":[['Tiruvannamalai', 'Vellore', 'Tirupathur','Ranipet'],Color.indigo],
	"South Arcot":[['Cuddalore','Vilippuram','Kallakurichi'], Color.violet],
	"Chinglepet":[['Chengalpattu','Kanchipuram','Tiruvallur'],Color('aa22aa')],
	"Tiruchirapalli":[['Karur','Tiruchirapalli','Perumbalur','Ariyalur'],Color('ffd711')], #fa8072
	Thanjavur=[['Pudukotai','Thanjavur','Tiruvarur','Nagapattinam','Mayiladithurai'],Color.peachpuff], #ffda89
	Madras=[['Chennai'], Color.lightgoldenrod],
	Nilgiris=[['Nilgiris'],Color('adff2f')],
	Kanyakumari=[['Kanyakumari'],Color.gold],	
	},
	{
		Salem=[['Salem','Namakkal'], Color.mediumspringgreen], 
		Dharmapuri=[['Dharmapuri','Krishnagiri'],Color.mediumspringgreen.darkened(.4)] 
	},
	{	
		Thanjavur=[['Thanjavur','Tiruvarur','Nagapattinam','Mayiladithurai'],Color.peachpuff], #ffda89
		Pudukotai=[['Pudukotai'], Color.peachpuff.darkened(.3)]
	},
	{
		Coimbatore=[['Tiruppur','Coimbatore'], Color.darkgreen],#006400
		Erode=[['Erode'], Color.darkgreen.lightened(.2)]
	},
	{
		Ramanathapuram=[['Ramanathapuram'], Color('fffa90')],
		Sivagangai=[['Sivagangai'], Color('fffa90').lightened(.2)],
		Virudhunagar=[['Virudhunagar'], Color.lightgreen.lightened(.3)], #fffacd
	},
	{
		Madurai=[['Madurai','Theni'], Color.lightgreen],
		Dindigul=[['Dindigul'], Color.lightgreen.lightened(.1)],
	},
	{
		Tirunelveli=[['Tirunelveli','Tenkasi'],Color.honeydew],#f0fff0
		Thoothukudi=[['Thoothukudi'],Color.honeydew.darkened(.2)]#f0fff0
	},
	{
		"North Arcot":[[],Color.transparent],
		Tiruvannamalai=[['Tiruvannamalai','Tirupathur'],Color.indigo],
		Vellore=[['Vellore','Ranipet'],Color.indigo.lightened(.3)]
	},
	{
		Thanjavur=[['Thanjavur'], Color.skyblue], #ffda89 
		Tiruvarur=[['Tiruvarur','Mayiladithurai'], Color.skyblue.darkened(.2)], #ffda89
		Nagapattinam=[['Nagapattinam'], Color.skyblue.darkened(.4)] #ffda89
	},
	{
		"South Arcot":[[],Color.transparent],
		"Cuddalore":[['Cuddalore'], Color.violet],
		"Vilippuram":[['Vilippuram','Kallakurichi'], Color.violet.lightened(.3)],
	},
	{	
		'Tiruchirapalli':[['Tiruchirapalli'], Color('ffd711')],
		"Perumbalur":[['Perumbalur','Ariyalur'], Color('ffd711').darkened(.2)],
		"Karur":[['Karur'], Color('ffd711').darkened(.4)]
	},
	{
		Madurai=[['Madurai'], Color.lightgreen],#90ee90
		Theni=[['Theni'], Color.lightgreen.darkened(.3)]#90ee90
	}, 
	{	
		Salem=[['Salem'], Color.mediumspringgreen],
		"Namakkal":[['Namakkal'], Color.mediumspringgreen.darkened(.3)],
	},
	{	
		"Chinglepet":[[],Color.transparent],
		"Tiruvallur":[['Tiruvallur'],Color('aa22aa')],
		"Kanchipuram":[['Chengalpattu','Kanchipuram'],Color('bb55bb')],
	},  
	{	Dharmapuri=[['Dharmapuri'],Color.mediumspringgreen.darkened(.4)], 
		"Krishnagiri":[['Krishnagiri'],Color.mediumspringgreen.darkened(.7)] 
	},
	{	
		"Perumbalur":[['Perumbalur'],Color('ddd711')],
		"Ariyalur":[['Ariyalur'],Color('ddd711').lightened(.3)]
	},
	{
		Coimbatore=[['Coimbatore'], Color.darkgreen],
		"Tiruppur":[['Tiruppur'], Color.darkgreen.lightened(.5)],
	},
	{
		Tirunelveli=[['Tirunelveli'],Color.honeydew],
		"Tenkasi":[['Tenkasi'],Color.honeydew.darkened(.3)],
	},
	{
		"Vilippuram":[['Vilippuram'], Color.violet.lightened(.3)],
		"Kallakurichi":[['Kallakurichi'], Color.violet.lightened(.8)],
	},
	{
		Tiruvannamalai=[['Tiruvannamalai'],Color.indigo],
		"Tirupathur":[['Tirupathur'],Color.indigo.darkened(.4)],
	},
	{
		Vellore=[['Vellore'],Color.indigo.lightened(.3)],
		"Ranipet":[['Ranipet'],Color.indigo.lightened(.6)],
	},
	{
		"Kanchipuram":[['Kanchipuram'],Color('bb55bb')],
		"Chengalpattu":[['Chengalpattu'],Color('bb55bb').darkened(.4)],		
	},
	{
		Tiruvarur=[['Tiruvarur'],Color.skyblue.darkened(.2)], #ffda89	
		"Mayiladithurai":[['Mayiladithurai'],Color.skyblue.darkened(.6)], #ffda89
	}
	]	

static func merge_dict(target, patch):
	for key in patch:
		target[key] = patch[key]

func add_historic_districts(year, data):
	var tmp:Polygon2D
	for i in data.keys():
		if data[i][0].size() > 0:
			tmp=merge_poly(data[i])
			tmp.hide()
			tmp.show_behind_parent=true
			tmp.name=i+'history'#year
			tmp.add_to_group(year)
		if has_node(i+'history'):
			remove_child(get_node(i+'history'))
		if tmp!=null:
			add_child(tmp)
			if has_node('lbl'+i):
				get_node('lbl'+i).show()
				get_node('lbl'+i).add_to_group(year)
			else:
				add_label(i, d[data[i][0][0]][0], d[data[i][0][0]][1], 0.0, 0.0, year)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()
		
func on_district_select(_viewport, event, _idx, district):
	if event is InputEventMouseButton and event.pressed:
		select(district)
		walkpath.clear_points()
		walkpath.add_point(get_node(district).position)
	
	#if event is InputEventMouseMotion:
			#walkpath.add_point(get_node(district).position)
	if event is InputEventScreenDrag:
		walkpath.add_point(get_node(district).position)
		highlight_district(district, false, true)

func select(district):
	if game_in_progress==1:
		if district == challenge:
			score+=1
			attempts+=1
			$HUD/Score.text=str(score)+' / '+str(attempts)
			#get_node(district).get_child(0).color=selected_color_right
			blink(district, selected_color_right)
			$Label.text=district
			var gpos=get_node(district).position
			$Label.rect_global_position =gpos
			timed_msg("Correct!", 2, 15)
			yield($Timer, "timeout")
			if attempts < turns:
				new_challenge()
		else:
			attempts+=1
			$HUD/Score.text=str(score)+' / '+str(attempts)
			get_node(district).get_child(0).color=selected_color_wrong
			$HUD/Message.text=challenge+"???\n  Try Again!\nThat was "+district
		if attempts==turns:
			timed_msg('Not bad! \nYou scored '+str(score)+' / '+str(turns),3, 25, Color.orangered)
			yield($Timer, "timeout")
			challenges_completed.clear()
			game_over()
	elif game_in_progress==2:
		pass
	else:
		get_tree().set_group("dlabels", "visible", false)
		#deselect district if one is already selected before selecting new one
		#selecting = change color + add border
		highlight_district(district, false)

func highlight_district(district, show_neighbours:=true, path:=false):
	if not path:
		if district!=selected_district and selected_district!='':
			deselect()
		else:
			if district==selected_district:
				# already selected so deselect
				deselect()
				$Label.text=''
				selected_district=''
				update() # redraw borders
				return
	else:
		get_node('lbl'+district).show()
	selected_district=district
	$Label.text=district
	var sd:Area2D=get_node(selected_district)
	$Label.rect_global_position=sd.position
	var poly=sd.get_child(0)
	poly.color=selected_color
	#selected_district_border_pts=PoolVector2Array(poly.polygon)
	if show_neighbours:
		var oa=sd.get_overlapping_areas()		#get_tree().set_group("dlabels", "visible", false)
		#wait for set completion
		var tmp=$Timer.wait_time
		$Timer.start(.3)
		yield($Timer, 'timeout')
		$Timer.wait_time=tmp
		for i in oa:
			if i.name=='Gopal':
				continue
			get_node('lbl'+i.name).visible=true
			i.get_child(0).color=deselect_color.blend("aa66aa22")
			#tw.interpolate_property(i.get_child(0), 'color', deselect_color, deselect_color.blend("aa66aa22"),1)
			#tw.start()
			#yield(tw,"tween_completed")
	update() # redraw borders
			
func deselect():
	for district in d.keys():
		get_node(district).get_child(0).color=deselect_color

func _draw():
	if game_in_progress==2 and clear_borders==false:
		for dx in dhistory[current_year-1]:
			if dhistory[current_year-1][dx][0].size() > 0: 
				var poly=PoolVector2Array(get_node(dx+'history').polygon)
				var cnt=poly.size()
				for i in range(1, cnt):
					draw_line(poly[i-1], poly[i], border_color, border_width_highlight)
				draw_line(poly[cnt-1], poly[0], border_color, border_width_highlight)
	else:
		for dx in d.keys():
			var poly=PoolVector2Array(get_node(dx).get_child(0).polygon)
			var cnt=poly.size()
			var center_at=Vector2(d[dx][0], d[dx][1])
			if dx != selected_district:
				for i in range(1, cnt):
					draw_line(poly[i-1]+center_at, poly[i]+center_at, border_color, border_width )
				draw_line(poly[cnt-1]+center_at, poly[0]+center_at, border_color, border_width )
			else:		
				for i in range(1, cnt):
					draw_line(poly[i-1]+center_at, poly[i]+center_at, border_color, border_width_highlight )
				draw_line(poly[cnt-1]+center_at, poly[0]+center_at, border_color, border_width_highlight )
	
func _on_Button_pressed():
	reset()
	game_in_progress=1
	$HUD/Score.text=str(score)
	timed_msg("You have 10 turns\n Find the Districts!",3)
	yield($Timer,"timeout")
	new_challenge()

var challenges_completed:=[]
func new_challenge():
	while true:
		challenge=d.keys()[rng.randi_range(0,len(d)-1)]
		if challenge in challenges_completed:
			continue
		else:
			challenges_completed.append(challenge)
			break
	$HUD/Message.text=challenge+" ???"

func game_over():
	deselect()
	walkpath.clear_points()
	$HUD/Score.text=''
	$HUD/Message.text=''
	$Label.text=''
	$HUD/Button.show()
	$HUD/Learn.show()
	$Camera2D.position=get_node('Karur').position
	show_compass()
	game_in_progress=0
	update() # redraw borders
	var tree=get_tree()
#	for i in years:
#		var ng=tree.get_nodes_in_group(i)
#		print(i,' ', tree.has_group(i), ' ',ng.size())
#		for j in ng:
#			print(j.name)
	print('GAME OVER ******',tree.get_node_count())

func blink(district, color):
	var dx=get_node(district).get_child(0)
	for i in 5:
		dx.modulate=color
		yield(get_tree(), "idle_frame")
		dx.modulate= Color(1.0, 1.0, 1.0)
		yield(get_tree(), "idle_frame")
	dx.modulate=Color(1.0, 1.0, 1.0)
	dx.color=color

func timed_msg(msg, showafter, blink:=0, blinkcolor:=Color.green):
	$Timer.wait_time=showafter
	$Timer.start()
	$HUD/Message.modulate= Color(1.0, 1.0, 1.0)
	$HUD/Message.text=msg
	if blink:
		for i in blink:
			$HUD/Message.modulate = blinkcolor
			yield(get_tree(), "idle_frame")
			$HUD/Message.modulate= Color(1.0, 1.0, 1.0)
			yield(get_tree(), "idle_frame")
		
	
func process(_delta):
	walkpath.show()

func borders(show):
	if show:
		clear_borders=false
		border_width=2
		border_color=Color.black
		update()
	else:
		clear_borders=true
		border_width=0
		border_color=Color.transparent
		update()

func reset(game_num:=100):
	score=0
	attempts=0
	$HUD/Button.hide()
	if game_num!=2:
		$HUD/Learn.hide()
	else:
		borders(false)
	hide_compass()
	if selected_district!='':
		deselect()
		$Label.text=''
		get_tree().set_group("dlabels","visible",false)

func fullwalktest():
	reset()
	game_in_progress=3
	var current='Chennai'
	var visited=[current]
	$Camera2D/Gopal/CollisionShape2D.disabled = true
	$Camera2D/Gopal.position=Vector2(0,0)
	#$Camera2D/Gopal/AnimatedSprite.animation = "walk"
	#$Camera2D/Gopal/AnimatedSprite.play()
	while len(visited) < len(d):
		var i:Area2D=get_node(current)
		var gpos=i.position
		walkpath.add_point(gpos)
		$Camera2D/Tween.interpolate_property($Camera2D,"position",$Camera2D.position,gpos,1.4)
		$Camera2D/Tween.start()
		# not required gopal will highlight
		$Label.text=current
		$Label.rect_global_position=get_node(current).position
		var poly=i.get_child(0)
		poly.color=selected_color
		var neighbours=i.get_overlapping_areas()
		for n in neighbours:
			if n.name == 'Gopal':
				continue
			if n.name in visited:
				continue
			else:
				current=n.name
				visited.append(n.name)
				break
		timed_msg('Districts visited\n'+str(len(visited))+' out of '+str(len(d)),1 )
		yield($Timer, "timeout")
		if(i.name == current):
			current=visited[-2]
		if(i.name == current):
			var jump
			while true:
				jump=d.keys()[rng.randi_range(0,len(d)-1)]
				if visited.has(jump) == false:
					current=jump
					break
			visited.append(jump)
	$Camera2D/Gopal/CollisionShape2D.disabled = false
	#$Camera2D/Gopal/AnimatedSprite.stop()
	game_over()

var df
func init_label_font():
	var f=load("res://Xolonium-Regular.ttf")
	df=DynamicFont.new()
	df.font_data=f
	df.size=44

func add_label(district, x, y, w, h, groupname):
	var l:Label=Label.new()
	l.set("custom_fonts/font",df)
	l.set("custom_colors/font_color", district_label_text_color)
	l.set("custom_colors/font_color_shadow", Color.black)
	l.set("custom_constants/shadow_offset_x",3)
	l.set("custom_constants/shadow_offset_y",3)
	l.set("custom_constants/shadow_as_outline",0)
	l.visible=false
	l.text=district
	l.name='lbl'+district
	l.rect_position=Vector2(x+w/2, y+h/2)
	l.add_to_group(groupname)
	add_child(l)

func _on_Labels_toggled(button_pressed):
	if button_pressed:
		get_tree().set_group("dlabels","visible",true)
		#$HUD/Labels["custom_styles/normal"].bg_color = Color("#bada55")
		$HUD/Labels["modulate"]=district_label_text_color
	else:
		get_tree().set_group("dlabels","visible",false)
		$HUD/Labels["modulate"]=Color(1.0, 1.0, 1.0)

var cell=preload("res://cell.tscn")
var district_animator

func _on_TN_ready():
	$Timer.start(1)
	yield($Timer,"timeout")
	var rd=get_node('Tiruvannamalai')
	var oa=rd.get_overlapping_areas()
	for i in oa:
		if i.name=='Gopal':
			continue
		i.add_to_group("North")
	get_node('Chennai').add_to_group('North')
	get_node('Tiruvallur').add_to_group('North')
	get_node('Tiruvannamalai').add_to_group('North')
	
	oa=get_node('Virudhunagar').get_overlapping_areas()
	for i in oa:
		if i.name=='Gopal':
			continue
		i.add_to_group("South")
	get_node('Virudhunagar').add_to_group('South')
	oa=get_node('Tirunelveli').get_overlapping_areas()
	for i in oa:
		if i.name=='Gopal':
			continue
		i.add_to_group("South")
	get_node('Tirunelveli').add_to_group('South')
	
	oa=get_node('Ariyalur').get_overlapping_areas()
	for i in oa:
		if i.name=='Gopal':
			continue
		i.add_to_group("East")
	get_node('Ariyalur').add_to_group('East')
	get_node('Pudukotai').add_to_group('East')
	get_node('Tiruvarur').add_to_group('East')
	get_node('Mayiladithurai').add_to_group('East')
	get_node('Nagapattinam').add_to_group('East')
		
	oa=get_node('Tiruppur').get_overlapping_areas()
	for i in oa:
		if i.name=='Gopal':
			continue
		i.add_to_group("West")
	get_node('Tiruppur').add_to_group('West')
	get_node('Namakkal').add_to_group('West')
	get_node('Salem').add_to_group('West')
	get_node('Nilgiris').add_to_group('West')
	#if OS.get_name()=='Android':
	#	$HUD/Message.anchor_left=.45
	district_animator=cell.instance()
	add_child(district_animator)
		
func _on_Player_hit(name):
	#$HUD/Message.text='Gopal has wandered into '+ name
	if $Camera2D/Gopal != null:
		#print('Gopal has wandered into '+ name+' '+str($Camera2D/Gopal.global_position))		
		highlight_district(name, false)

var years=["1956","1965","1974","1979","1985",
"1985x2","1986","1989","1991",
"1993","1995","1996","1997","1997x2",
"2004","2007","2007x2",
"2019","2019x2","2019x3","2019x4","2019x5",
"2020"]
var current_year=0

func name(n):
	#print(n.name)
	if n.name == 'North Arcothistory':
		return 'Tiruvannamalai'
	elif n.name == 'South Arcothistory':
		return 'Cuddalore'
	elif n.name == 'Chinglepethistory':
		return 'Kanchipuram' 
	elif n.name == 'Trichyhistory':
		return 'Tiruchirapalli' 
	elif n.name == 'Madrashistory':
		return 'Chennai' 
	else:
		return n.name.replace('history','')

var clear_borders:=false
func _on_Learn_toggled():
	#print('STEP ***********', get_tree().get_node_count())
	var old
	var newlist
	while true:
		if game_in_progress!=2:		 
			game_in_progress=2
			reset(2)
			add_historic_districts(years[current_year], dhistory[0])
			# using karur as proxy center
			old=[{node=get_node('Karur'),loc=get_node('Karur').position}] #d['Karur']}]
			newlist=[]
			for n in get_tree().get_nodes_in_group(years[current_year]):
				if n is Polygon2D:
					#newlist.append({node=n, loc=d[name(n)]})
					newlist.append({node=n, loc=get_node(name(n)).position}) #d[name(n)]})
			district_animator.start(old, newlist)
			yield(district_animator, "move_complete")
			borders(true)
			get_tree().call_group(years[current_year],"show")
			current_year=current_year+1
			update() # careful draw uses current_year - 1 
			continue
		if current_year>=len(years):
			for i in range(0,len(years)):
				get_tree().call_group(years[i],"hide")
				get_tree().call_group(years[i],"queue_free")
				current_year=0
				get_tree().call_group('1956',"hide")
				$HUD/Learn.text='1956'
			game_over()
			print('after queue free ***********', get_tree().get_node_count())
			return
		#get_tree().set_group(years[current_year-1],"modulate",Color(0.0,0.0,0.0))
		get_tree().call_group(years[current_year-1],"hide")
		newlist=[]
		var key=dhistory[current_year].keys()[0]	
		old=[{node=get_node(key+'history'), loc=get_node(name(get_node(key+'history'))).position}]#get_node(name(key)).position}] #get_node(key).position}]
		add_historic_districts(years[current_year], dhistory[current_year])
		
		for n in get_tree().get_nodes_in_group(years[current_year]):
			if n is Polygon2D:
				#newlist.append({node=n, loc=d[name(n)]})
				newlist.append({node=n, loc=get_node(name(n)).position}) #d[name(n)]})
		district_animator.start(old, newlist)
		yield(district_animator, "move_complete")
		get_tree().call_group(years[current_year],"show")
		borders(true)
		$HUD/Learn.text=years[current_year]
		current_year=current_year+1
		
