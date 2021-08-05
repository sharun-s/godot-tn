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
var game_in_progress=false
var rng=RandomNumberGenerator.new()

var challenge:=''
var selected_district:=''
var selected_color:=Color.darkorange
var deselect_color:=Color.lightyellow#Color("eeffcc88")
var selected_color_right:=Color.lightgreen
var selected_color_wrong:=Color.lightcoral
var border_color
var border_width
var tw:=Tween.new()
var walkpath:=Line2D.new()

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

func _ready():
	init_label_font()
	rng.randomize()
	add_child(tw)
	add_child(walkpath)
	VisualServer.set_default_clear_color(Color("ff000000"))
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
		add_label(district, x, y, w, h)
		a2d.connect('input_event', self, 'on_district_select',[district])
		
	$Camera2D.position=get_node('Karur').position
	$Camera2D.zoom=Vector2(2.4, 2.4)
	update()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()
		
func on_district_select(_viewport, event, _idx, district):
	if event is InputEventMouseButton and event.pressed:
		select(district)

func select(district):
	if game_in_progress:
		if district == challenge:
			score+=1
			attempts+=1
			$HUD/Score.text=str(score)+' / '+str(turns)
			get_node(district).get_child(0).color=selected_color_right
			$HUD/Label.text=district
			var gpos=get_node(district).position
			$HUD/Label.rect_global_position =Vector2(330,0)+ gpos/($Camera2D.zoom) 
			timed_msg("Correct!", 2)
			yield($Timer, "timeout")
			if attempts < turns:
				new_challenge()
		else:
			attempts+=1
			$HUD/Score.text=str(score)+' / '+str(turns)
			get_node(district).get_child(0).color=selected_color_wrong
			$HUD/Message.text='That was '+district
		if attempts==turns:
			timed_msg('Not bad! \nYou scored '+str(score)+' / '+str(turns),3)
			yield($Timer, "timeout")
			game_in_progress=false
			game_over()
	else:
		get_tree().set_group("dlabels", "visible", false)
		#deselect district if one is already selected before selecting new one
		#selecting = change color + add border
		if district!=selected_district and selected_district!='':
			deselect()
		else:
			if district==selected_district:
				# already selected so deselect
				deselect()
				$HUD/Label.text=''
				selected_district=''
				return
		selected_district=district
		$HUD/Label.text=district
		var sd:Area2D=get_node(selected_district)
		var gpos=sd.position
		$HUD/Label.rect_global_position =Vector2(330,0)+ gpos/($Camera2D.zoom) 
		var poly=sd.get_child(0)
		poly.color=selected_color
		#selected_district_border_pts=PoolVector2Array(poly.polygon)
		var oa=sd.get_overlapping_areas()
		#get_tree().set_group("dlabels", "visible", false)
		#wait for set completion
		var tmp=$Timer.wait_time
		$Timer.start(.3)
		yield($Timer, 'timeout')
		$Timer.wait_time=tmp
		for i in oa:
			get_node('lbl'+i.name).visible=true
			tw.interpolate_property(i.get_child(0), 'color', deselect_color, deselect_color.blend("aa66aa22"),1)
			tw.start()
			#yield(tw,"tween_completed")
		update()
				
func deselect():
	for district in d.keys():
		get_node(district).get_child(0).color=deselect_color
	#var sd=get_node(selected_district)
	#sd.get_child(0).color=deselect_color
	#var oa=sd.get_overlapping_areas()
	#for i in oa:
	#	i.get_child(0).color=deselect_color

func _draw():
	for i in d.keys():
		var poly=PoolVector2Array(get_node(i).get_child(0).polygon)
		if i == selected_district:
			draw_border(poly, i, true)
		else:
			draw_border(poly, i, false)
			
func draw_border(poly:PoolVector2Array, dist:String, selected:bool):
	var cnt=poly.size()
	var center_at=Vector2(d[dist][0], d[dist][1])
	if selected:
		border_color=Color.black
		border_width=5
	else:
		border_color=Color.black
		border_width=2 
	for i in range(1, cnt):
		draw_line(poly[i-1]+center_at, poly[i]+center_at, border_color, border_width )
	draw_line(poly[cnt-1]+center_at, poly[0]+center_at, border_color, border_width )
	
func _on_Button_pressed():
	$HUD/Button.hide()
	$HUD/Learn.hide()
	start_game()

func start_game():
	score=0
	attempts=0
	if selected_district!='':
		deselect()
		$HUD/Label.text=''
	game_in_progress=true
	$HUD/Score.text=str(score)
	timed_msg("You have 10 turns\n Find the Districts!",3)
	yield($Timer,"timeout")
	new_challenge()

func new_challenge():
	challenge=d.keys()[rng.randi_range(0,len(d)-1)]
	$HUD/Message.text=challenge+" ???"

func game_over():
	deselect()
	walkpath.clear_points()
	$HUD/Score.text=''
	$HUD/Message.text=''
	$HUD/Label.text=''
	$HUD/Button.show()
	$HUD/Learn.show()

func timed_msg(msg, showafter):
	$Timer.wait_time=showafter
	$Timer.start()
	$HUD/Message.text=msg

func process(_delta):
	walkpath.show()

func _on_Learn_pressed():
	score=0
	attempts=0
	$HUD/Button.hide()
	$HUD/Learn.hide()
	if selected_district!='':
		deselect()
		$HUD/Label.text=''
	var current='Chennai'
	var visited=[current]	
	while len(visited) < len(d):
		var i:Area2D=get_node(current)
		var gpos=i.position
		walkpath.add_point(gpos)
		#print(gpos, $Camera2D.position, $HUD/Label.rect_global_position,' ', $HUD/Label.get_viewport_rect())
		#print(gpos,$Camera2D.position, $Camera2D.global_position)
		#$Camera2D.position=gpos
		#$HUD/Label.text=current
		#$HUD/Label.rect_global_position=Vector2(330,0)+(gpos/$Camera2D.zoom)#.set_position(gpos)
		$Camera2D/Tween.interpolate_property($Camera2D,"position",$Camera2D.position,gpos,1)
		$Camera2D/Tween.start()
		$HUD/Label.text=current
		$HUD/Label.set_position(Vector2(780,384))
		var poly=i.get_child(0)
		poly.color=selected_color
		var neighbours=i.get_overlapping_areas()
		for n in neighbours:
			if n.name in visited:
				continue
			else:
				current=n.name
				visited.append(n.name)
				break
		timed_msg(i.name+' -> '+current+' '+str(len(visited))+' '+str(len(d)),1 )
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
	game_over()

var df
func init_label_font():
	var f=load("res://Xolonium-Regular.ttf")
	df=DynamicFont.new()
	df.font_data=f
	df.size=44

func add_label(district, x, y, w, h):
	var l:Label=Label.new()
	l.set("custom_fonts/font",df)
	l.set("custom_colors/font_color", 'f6b016')
	l.set("custom_colors/font_color_shadow", Color.black)
	l.set("custom_constants/shadow_offset_x",3)
	l.set("custom_constants/shadow_offset_y",3)
	l.set("custom_constants/shadow_as_outline",0)
	l.visible=false
	l.text=district
	l.name='lbl'+district
	l.rect_position=Vector2(x+w/2, y+h/2)
	l.add_to_group('dlabels')
	add_child(l)
	
func _on_Labels_toggled(button_pressed):
	if button_pressed:
		get_tree().set_group("dlabels","visible",true)
	else:
		get_tree().set_group("dlabels","visible",false)
