extends Node2D
var CD
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
var district_label_text_color:=Color('f6b000')
var border_color=deselect_color.darkened(.1)#Color.darkgray#.black#Color.firebrick
var border_width:=3
var tw:=Tween.new()
#var walkpath:=Line2D.new()
#var path=[]

func revert_transform(poly:Polygon2D):
	if poly.transform != Transform2D.IDENTITY:
		var transformed_polygon = poly.transform.xform(poly.polygon)
		poly.transform = Transform2D.IDENTITY
		poly.polygon = transformed_polygon
		return poly

func get_largest_poly(m):
	var maxpts=0
	var maxidx=0
	for i in len(m):
		if len(m[i]) > maxpts:
			maxidx=i
			maxpts=len(m[i])
	return maxidx

func merge_poly(history_item):
	var g=history_item[0]
	#var colr=history_item[1]
	var main
	var t=Transform2D()
	var center=CD.position
	var ddims=CD.get_node(g[0]).position 
	var p1=CD.get_node(g[0])
	t.origin=center+Vector2(ddims[0],ddims[1])
	var m
	if g.size()==1:
		main=t.xform(p1.polygon)
	else:
		var t2=Transform2D()
		ddims=CD.get_node(g[1]).position
		var p2=CD.get_node(g[1])
		t2.origin=center+Vector2(ddims[0],ddims[1])
		m=Geometry.merge_polygons_2d(t.xform(p1.polygon),t2.xform(p2.polygon) )
		main=m[get_largest_poly(m)]
		for i in range(2,len(g)):
			ddims=CD.get_node(g[i]).position 
			t.origin=center+Vector2(ddims[0],ddims[1])
			var tp=t.xform(CD.get_node(g[i]).polygon)
			m=Geometry.merge_polygons_2d(main, tp)
			main=m[get_largest_poly(m)]
	return main

#var shore:ShaderMaterial
#func applyshore(district):
#	var dp:Polygon2D=get_node(district).get_child(0)
#	dp.material=shore

func _process(delta):
	OS.set_window_title( " | fps: " + str(Engine.get_frames_per_second()))

func _ready():
	init_label_font()
	add_child(tw)
	var master_sound = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_sound, true)
	#shore=ShaderMaterial.new()
	#shore.shader=load("res://shore1.shader")
	rng.randomize()
	for i in Data.citygrades:
		$HUD/Top/LabelCities.add_item(i)
	VisualServer.set_default_clear_color('001f3f')#Color("ff222222"))
	$Districts/ClickDetector.connect('input_event', self, 'on_district_select')
	
	var t=get_viewport_transform()
	var viewp=get_viewport_rect()
	#var hcenter=viewp.size.x/2
	#var widthmultiplier= viewp.size.x/800
	#print(viewp)
	#print($Districts.get_viewport_rect()) 
	# 4 cases
	# Full screen mode
	# Window width < heigh
	# Window width > height
	# On window resize - not really required right now but adding for completeness
	# Main method used is keep Height and Width generated by py script same
	# Set Stretch Mode to 2D [primarily for portrait mode to work]
	# Set aspect to expand [primarily for portrait mode to work]
	# In portrait mode infobox and startscreen are 1 column
	# In landscape mode info box is spread out to 3 column and startscreen is 2 column
	# In landscape mode due to Stretch MOde setting above orgin has to be pushed left
	# In landscape mode due to Stretch MOde setting scale has to be reset by viewport.size.y/800 to maintain aspect
	if viewp.size.x < viewp.size.y: #portrait mode
		$HUD/StartScreen.columns=1
		$HUD/Grid.columns=3
		$HUD/Grid.anchor_top=0.5
		$HUD/Grid.anchor_right=1.0
		$HUD/Grid/MarginContainer.alignment=BoxContainer.ALIGN_END
		$HUD/Grid/MarginContainer.grow_horizontal=Control.GROW_DIRECTION_BEGIN
		$HUD/Grid/MarginContainer.size_flags_horizontal=Control.SIZE_EXPAND_FILL
	else:
		$HUD/StartScreen.columns=2
		$HUD/Grid.columns=1
		$HUD/Grid.anchor_right=.3
		t.origin=Vector2(viewp.size.x/2-300,0)
		transform=t
		scale=Vector2(get_viewport_rect().size.y/800, get_viewport_rect().size.y/800)
				
	#if viewp.size.x < 600: #portraitt mode
#		t.origin=Vector2(viewp.size.x/2,0)
#		transform=t
#		scale=Vector2(get_viewport_rect().size.x/600, get_viewport_rect().size.y/800)	
#	else:
#		#divide screen width by 2 and push left 
#		#by half of generatedwidth ie 600/2
#		t.origin=Vector2(viewp.size.x/2-300,0)
#		transform=t
#		#so viewport rect changes thanks to above transform which is why viewp can be used while scaling
#		scale=Vector2(get_viewport_rect().size.x/800, get_viewport_rect().size.y/800)
#	$Label.rect_scale=Vector2(1/scale.x, 1/scale.y)
	#$HUD/Top/Score.rect_scale=Vector2(2/scale.x, 2/scale.y)
	#for debugging resolution
	if OS.has_feature("editor"):
		print(scale)
		print(t.origin)
		$HUD/StartScreen/Title.text=str(get_viewport_rect())+"\nScale:"+str(scale)+' Origin'+str(t.origin)

#print out neighbours when monitoring/monitorable is on
#By hardcoding neighbours reliance on Area2d monitoring and monitorable removed
#Since nothing is bumping into districts monitoring for collisions is unneccesary performance drainage
#func gen_dneighbours():
#	for i in d.keys():
#		printraw(i,'=[')
#		for j in neighbours('Districts/'+i):
#			printraw('"',j,'",')
#		print('],')

func _on_TN_ready():
	#$HUD/HistoryControl.rect_scale=Vector2(1/scale.x, 1/scale.y)
	uiScore=get_node("HUD/Top/R1/Score")
	CD=$Districts/ClickDetector
	for dx in CD.get_children():
		dx.set_meta('color',deselect_color)
		dx.set_meta('labelcolor',labelcolor_off)
		dx.set_meta('labelbgcolor',labelcolor_off)
		dx.set_meta('labelbarcolor',labelcolor_off)
		add_label(dx.name, CD.position+dx.position, 'testlabels')
	get_tree().call_group("allcities","hide")
	print('click map shape count', Physics2DServer.area_get_shape_count($Districts/ClickDetector.get_rid()))
	get_tree().call_group("testlabels","hide")
	$Label.rect_position=-1*transform.origin
	$Label.rect_scale = Vector2(400/$Label.rect_size.x, 800/$Label.rect_size.y)
	$Label["custom_colors/font_color"]="#42006680"#$HistoryAnimator.bcolor.lightened(.5)
	#debug prints cities per district, district history etc
	#for dt in d.keys():
	#	print(dt, get_history(dt))
	#	print( dt, len(get_tree().get_nodes_in_group(dt)))

var uiScore

static func merge_dict(target, patch):
	for key in patch:
		target[key] = patch[key]

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()
		
func on_district_select(_viewport, event, idx):
	if event is InputEventMouseButton:
		if event.pressed:
			#print('mpress ', idx)#print(dn.get_child(idx))
			var dn=$Districts/ClickDetector
			#SHAPE_IDX can be a large bunch of number cuz collision poly is a combo of many shapes
			#to find the collision poly object using shape.find_owner
			#this is probably why nodes and object counts were so high
			var o=dn.shape_find_owner(idx)
			#.shape_owner_shape_count(o)#print(dn.get_rid().get_id())#print(dn.get_child(o).name)
			$Gopal.path.clear()
			$Gopal.path.append(dn.get_child(o).name)#district)
			#print(dn.get_child(o).name,' ', idx)
			#colpol apparently doesnt have rids
			#print('shapes within colpol ',Physics2DServer.body_get_shape_count(dn.get_child(o).get_rid()))
		else:
			#print('mrelease ', idx)
			var dn=$Districts/ClickDetector
			var o=dn.shape_find_owner(idx)
			#on release touch check whats in path and move if required
			decide_action(dn.get_child(o).name)#district)
		#walkpath.clear_points()
		#walkpath.add_point(get_node(district).position)
	#on hover show label
	#if event is InputEventMouseMotion:
	#	$Label.text=district
	#	$Label.rect_position=center(district)
#			#walkpath.add_point(get_node(district).position)
	if event is InputEventScreenDrag:
		var dn=$Districts/ClickDetector
		var o=dn.shape_find_owner(idx)
		var district = dn.get_child(o).name
		if district in $Gopal.path:
			pass
		else:
			$Gopal.path.append(district)
		#walkpath.add_point(get_node(district).position)
#		highlight_district(district, false, true)

func setDistrict_Color_Text(dist, c, showlabel:=true):
	#get_node(dist).color=c
	CD.get_node(dist).set_meta('color',c)
	if showlabel:
		CD.get_node(dist).set_meta('labelcolor',labelcolor)
		CD.get_node(dist).set_meta('labelbgcolor',Color.black)
		CD.get_node(dist).set_meta('labelbarcolor',Color.orange)
	else:
		CD.get_node(dist).set_meta('labelcolor',labelcolor_off)
		CD.get_node(dist).set_meta('labelbgcolor',labelcolor_off)
		CD.get_node(dist).set_meta('labelbarcolor',labelcolor_off)
	update()

func decide_action(district):
	if game_in_progress==1 and attempts < turns:
		if district == challenge:
			score+=1
			attempts+=1
			uiScore.text=str(score)+' / '+str(attempts)
			setDistrict_Color_Text(district, selected_color_right, false)
			$Districts/ClickDetector.input_pickable=false
			timed_msg("[color=#"+selected_color_right.to_html(false)+"]Correct![/color]", 1)#, 2)
			yield($Timer, "timeout")
			if attempts < turns:
				new_challenge()
				$Districts/ClickDetector.input_pickable=true
		else:
			attempts+=1
			uiScore.text=str(score)+' / '+str(attempts)
			#get_node(district).color=selected_color_wrong
			setDistrict_Color_Text(district, selected_color_wrong, false)
			$HUD/Message.bbcode_text=challenge+"???\n  [color=#ee2211]Try Again![/color]\nThat was "+district
		if attempts==turns:
			$Districts/ClickDetector.input_pickable=false
			if timedquiz:
				$QuizTimer.stop()
				#TODO perf optimize pulse
				#timed_msg('[color=#ffcc99][pulse color=#ffcc33 freq=10]Not bad! \nYou scored '+str(score)+' / '+str(turns)+'\n Taking '+str(seconds)+' seconds[/pulse][/color]',2, 8, Color.orangered)
				timed_msg('[color=#'+Color.orangered.to_html(false) +']Not bad! \nYou scored '+str(score)+' / '+str(turns)+'\n Taking '+str(seconds)+' seconds[/color]',2.5)
			else:
				#timed_msg('[pulse freq=5][color=#ffcc55]Not bad! \nYou scored '+str(score)+' / '+str(turns)+'[/color][/pulse]',2, 8, Color.orangered)
				timed_msg('Not bad! \nYou scored '+str(score)+' / '+str(turns),2.5)
			yield($Timer, "timeout")
			challenges_completed.clear()
			$Districts/ClickDetector.input_pickable=true
			game_over()
	elif game_in_progress==2:
		#history
		pass
	elif game_in_progress==3:
		#quest
		#if !moving:
		gotoDistrict()
	elif game_in_progress==4 and attempts < turns:
		#CITY QUIZ
		$Cities._draw_cities('','',ctmp.name, ctmp.position, ctmp.radius)
		#print(ctmp.name, ctmp.position, ctmp.radius)
		$Districts/ClickDetector.input_pickable=false
		if district == challenge:
			score+=1
			attempts+=1
			uiScore.text=str(score)+' / '+str(attempts)
			setDistrict_Color_Text(district, selected_color_right,false)
			timed_msg("[color=#"+selected_color_right.to_html(false)+"]Correct![/color]", 1)#, 2)
		else:
			attempts+=1
			uiScore.text=str(score)+' / '+str(attempts)
			setDistrict_Color_Text(district,selected_color_wrong,false)
#			var clist=[]
#			for i in $Cities.of[district.split('/')[1]]:
#				clist.append(i.name)
#			timed_msg("[color=#ee2211]Oops!!![/color]\n"+district.split('/')[1] + "\ncontains "+str(clist).replace('[','').replace("]","")+"\n[color=#eeee11]"+ctmp.name+' is in '+challenge+"[/color]", 5)
			timed_msg("[color=#ee2211]Oops!!![/color]\n"+ctmp.name+' is in [color=#eede11]'+challenge+"[/color]", 3)
		yield($Timer, "timeout")
		if attempts < turns:
			new_city_challenge()
			$Districts/ClickDetector.input_pickable=true
		if attempts==turns:
			$Districts/ClickDetector.input_pickable=false
			if timedcityquiz:
				$QuizTimer.stop()
				#TODO perf optimize pulse
				#timed_msg('[color=#ffcc99][pulse color=#ffcc33 freq=10]Not bad! \nYou scored '+str(score)+' / '+str(turns)+'\n Taking '+str(seconds)+' seconds[/pulse][/color]',2, 8, Color.orangered)
				timed_msg('[color=#'+Color.orangered.to_html(false) +']Not bad! \nYou scored '+str(score)+' / '+str(turns)+'\n Taking '+str(seconds)+' seconds[/color]',2.5)
			else:
				#timed_msg('[pulse freq=5][color=#ffcc55]Not bad! \nYou scored '+str(score)+' / '+str(turns)+'[/color][/pulse]',2, 8, Color.orangered)
				timed_msg('Not bad! \nYou scored '+str(score)+' / '+str(turns),2.5)
			#TODO disable mouse/touch event handling while showing messages to player
			yield($Timer, "timeout")
			challenges_completed.clear()
			$Cities.clear()
			$Districts/ClickDetector.input_pickable=true
			game_over()
	else:
		#get_tree().set_group("dlabels", "visible", false)
		#check if path has anything and move
		#if !moving:
		gotoDistrict()

enum selectionType {
	new, #moving from no selected district to first selected district
	change, #moving from one selected district to another
	deselection, #selected district is clicked again
	}

#TODO should probable be a property of districts
#TODO test with mode switch - history>explore, explore>history, quiz>history etc
func selection_state(district):
	#print(district, selected_district)
	if district!=selected_district:
		if selected_district!='':
			return selectionType.change
		else:
			return selectionType.new
	else:
		if district==selected_district:
			return selectionType.deselection
	return selectionType.new
			
#deselect district if one is already selected before selecting new one
#selecting = change color + add border
# returns selection transition type - maybe change, deselection, new
func highlight_district(district, show_neighbours:=true):
	var state=selection_state(district)
	if game_in_progress!=3:
		if state == selectionType.change:
			deselect() #new district has been selected - remove higlight of old one
		else:
			# already selected so deselect
			if state == selectionType.deselection:
				infogrid_disappear()
				deselect()
				selected_district=''
				update() # redraw borders
				return state
	selected_district=district
	setDistrict_Color_Text(district, selected_color,false)
	if show_neighbours:
		_on_Grid_show_neighbours(true)
	#update() # redraw borders
	return state
			
func deselect():
	for node in $Districts.get_children():
		if node is Label:
			node.visible=false
	for node in CD.get_children():
		node.set_meta('color', deselect_color)
	
var historic_poly_cache={}
 
#Dont add too many if conditions here. Instead set meta data like border color, selected district on some user action and then call update()
# redraw should as fast as possible
func _draw():
	var ts
	if OS.has_feature("editor"):
		ts=OS.get_ticks_msec()
	if game_in_progress==2:
		draw_historic_borders()
		#if OS.has_feature("editor"):
		#	print('histdraw took ', OS.get_ticks_msec()-ts)
		return
	
	var t:Transform2D=Transform2D()
	for dx in CD.get_children():
		t.origin=CD.position + dx.position
		var poly=t.xform(PoolVector2Array(dx.polygon))
		var cnt=poly.size()
		draw_colored_polygon(poly, dx.get_meta('color'))
		draw_polyline(poly, border_color, border_width)
	var tpos
	for dx in CD.get_children():
		if len(labelpos)==0:
			break
		tpos=labelpos[dx.name]
		draw_rect(Rect2(tpos - Vector2(labelmargin, labelfontht-labelmargin), Vector2(len(dx.name)*labelfontwd, labelfontht+2*labelmargin)), dx.get_meta('labelbgcolor'))
		draw_rect(Rect2(tpos - Vector2(labelmargin+4, labelfontht-labelmargin), Vector2(4, labelfontht+2*labelmargin)), dx.get_meta('labelbarcolor'))
		draw_string(df, tpos, dx.name, dx.get_meta('labelcolor'))
	if OS.has_feature("editor"):
		print('drawtime ',OS.get_ticks_msec() - ts)
		
func _on_Quiz_pressed():
	reset()
	game_in_progress=1
	uiScore.text=str(score)
	uiScore.visible=true
	$HUD/TopRight/Labels.hide()
	$HUD/Message.show()
	timed_msg("[pulse color=#22ff44 height=-10 freq=10]You have 10 turns\n Find the Districts![/pulse]",2)
	yield($Timer,"timeout")
	timedquiz=false
	new_challenge()


var challenges_completed:=[]
func new_challenge():
	while true:
		challenge=CD.get_child(rng.randi_range(0,CD.get_child_count()-1)).name
		if challenge in challenges_completed:
			continue
		else:
			challenges_completed.append(challenge)
			break
	$HUD/Message.bbcode_text=challenge+" ???"

var timedcityquiz:=false
var ctmp
func new_city_challenge():
	var citycount=len(Data.Cities)
	while true:
		ctmp=Data.Cities[rng.randi_range(0,citycount-1)]
		challenge=ctmp.district
		if challenge in challenges_completed:
			continue
		else:
			challenges_completed.append(challenge)
			break
	$HUD/Message.bbcode_text=ctmp.name+" ???"
	
func game_over():
	deselect()
	$Gopal.path.clear()
	selected_district=''
	seconds=0
	$HUD/TopRight/Labels.hide()
	$HUD/Top/LabelCities.hide()
	#borders(true)
	#game_in_progress=0
	$HUD/Timeline.hide()
	$HUD/Timeline.bbcode_text=''
	#walkpath.clear_points()
	uiScore.text=''
	uiScore.visible=false
	$HUD/TopRight/Clock.hide()
	$HUD/Message.hide()
	$HUD/Message.bbcode_text=''
	#$Gopal.show()
	$HUD/StartScreen.show()
	update() # redraw borders
	#var tree=get_tree()
#	for i in years:
#		var ng=tree.get_nodes_in_group(i)
#		print(i,' ', tree.has_group(i), ' ',ng.size())
#		for j in ng:
#			print(j.name)
#	print('GAME OVER ******',tree.get_node_count())

func timed_msg(msg, period):#, blink:=0, blinkcolor:=Color.green):
	$HUD/Message.bbcode_text=msg
	$Timer.wait_time=period
	$Timer.start()

func reset():
	score=0
	attempts=0
	# gopal state depends on game - explore/quest/multiquest show - history/quiz/timedquiz hide
	$Gopal.hide()
	$HUD/StartScreen.hide()
	infogrid_disappear()
	if selected_district!='':
		deselect()
		get_tree().set_group("dlabels","visible",false)

func gotoDistrict():
	$HUD/StartScreen.hide()
	var current
	var distance
	var time
	CD.input_pickable=false
	while $Gopal.path.size() > 0 :
		current=$Gopal.path.pop_front()
		var st=highlight_district(current,false)
		var target=$Cities.of[current][0].position
		#var target=CD.position+CD.get_node(current).position#+Vector2(d[current][2]/2, d[current][3]/2 )
		$Gopal.goto(target, current)
		var x=yield($Gopal.tw, 'tween_all_completed')
		#TODO test what happens when clicking around while Gopal is moving to target
		#print('selection type ', selectionType.keys()[st])
		if st != selectionType.deselection:
			showinfo(current, st)
	CD.input_pickable=true
	#$Gopal/CollisionShape2D.disabled = false
	#if game_in_progress !=3:
	#	enableui()
		
var df
var labelstyle=preload("res://labelstyle.tres")
var labelfont=load("res://DroidSans.ttf")
var labelfontht=16
var labelfontwd=int(labelfontht * 12/22)+1
var labelmargin=2
var labelcolor=Color( 1, 0.93, 0.094, 1 )
var labelcolor_off:=Color.transparent
func init_label_font():
	df=DynamicFont.new()
	df.font_data=labelfont
	df.size=labelfontht
	
# used in history mode to label old districts each step
# why not use draw string - cause group show hide is more convenient polys and labels stay linked
#var lcnt=0
#var cs2d=CircleShape2D.new()
func add_label(district, pos, groupname):
	var r=RigidBody2D.new()
	r.mode=RigidBody2D.MODE_CHARACTER
	r.gravity_scale=0
	#r.constant_linear_velocity=Vector2(0.0, -3.0)
	#r.collision_mask=2
	#r.collision_layer=2
	var l:Label=Label.new()
	#df.size=labelfontht
	l.set("custom_fonts/font",df)
	l.set("custom_colors/font_color", labelcolor)
	l.set("custom_styles/normal", labelstyle)
	#l.set("custom_colors/font_color_shadow", Color.black)
	#l.set("custom_constants/shadow_offset_x",3)
	#l.set("custom_constants/shadow_offset_y",3)
	#l.set("custom_constants/shadow_as_outline",0)
	#l.visible=false
	l.text=district
	l.rect_position=pos +Vector2(30,30)
	#l.rect_scale=Vector2(1/scale.x, 1/scale.y)
	l.add_to_group(groupname)
	var c=CollisionShape2D.new()
	c.modulate=Color.green
	var r2d:RectangleShape2D=RectangleShape2D.new()
	r2d.extents=l.rect_size/2
	c.position=pos +Vector2(30,30)+ l.rect_size/2
	#print(district, c.position) 
	c.shape=r2d
	r.add_child(c)
	r.add_child(l)
	#r.position=pos
	add_child(r)

func _on_Labels_toggled(button_pressed):
	if button_pressed:
		for dx in CD.get_children():
			dx.set_meta('labelcolor',labelcolor)
			dx.set_meta('labelbgcolor',Color.black)
			dx.set_meta('labelbarcolor',Color.orange)
		#get_tree().set_group("testlabels","visible",true)
		#$HUD/TopRight/Labels["custom_styles/normal"].bg_color = Color("#bada55")
		$HUD/TopRight/Labels["modulate"]=labelcolor
	else:
		for dx in CD.get_children():
			dx.set_meta('labelcolor',labelcolor_off)
			dx.set_meta('labelbgcolor',labelcolor_off)
			dx.set_meta('labelbarcolor',labelcolor_off)
		#get_tree().set_group("testlabels","visible",false)
		$HUD/TopRight/Labels["modulate"]=Color(1.0, 1.0, 1.0)
	update()

var labelpos={}
func calculate_lable_layout():
	if len(labelpos) == 0:
		for x in get_children():
			if x is RigidBody2D:
				labelpos[x.get_child(1).text]=x.transform.origin+x.get_child(1).rect_position
				x.queue_free()

func enableui():
	$HUD/StartScreen.show()
	#$HUD/TopRight/Labels.hide()
	
#overlapping areas will likely only work if col pols are in individual areas
#todo not sure what happens with single area2d - also monitorable and monitoring are turned off
func neighbours(districtname):
	return Data.neighbours[districtname]
#	var l=get_node(districtname).get_overlapping_areas()
#	var n=[]
#	for i in l:
#		if i.name !='Gopal':
#			n.append(i.name)
#	return n

var current_year=0

func name(n):
	#print(n.name)
	if n == 'North Arcot' or n=='North Arcothistory':
		return 'Tiruvannamalai'
	elif n == 'South Arcot' or n=='South Arcothistory':
		return 'Cuddalore'
	elif n == 'Chinglepet' or n=='Chinglepethistory':
		return 'Kanchipuram'
	elif n == 'Trichy':
		return 'Tiruchirapalli'
	elif n == 'Madrashistory':
		return 'Chennai'
	else:
		return n.replace('history','')

var clear_borders:=false

func add_to_dist_timeline(names):
	if names.size()==2:
		$HUD/Timeline.append_bbcode(' '+names[0]+', '+names[1])
		return
	if names.size()==3:
		$HUD/Timeline.append_bbcode(' '+names[0]+', '+names[1]+'\n        '+names[2])
		return
	$HUD/Timeline.append_bbcode(' '+names[0]+', '+names[1]+'\n')
	for s in range(2, names.size(),2):
		if s+1 < names.size():
			$HUD/Timeline.append_bbcode('         '+names[s]+', '+names[s+1]+'\n')
		else:
			$HUD/Timeline.append_bbcode('         '+names[s])

func center(district):
	#return get_node(district).position+Vector2(d[district][2]/2, d[district][3]/2)
	return CD.position + CD.get_node(district).position + Vector2(50, 50)

var hdcnt=0
func draw_historic_borders():
	hdcnt=hdcnt+1
	print('histdraw called' , hdcnt, ' ', current_year, ' ', historic_poly_cache.keys() )
	#if current year is 0 for loop below doesnt run
	if current_year==0:
		#print('draw ', current_year)
		for idx in historic_poly_cache[Data.years[0]]:
			var poly=historic_poly_cache[Data.years[0]][idx]
			draw_polyline(poly, $HistoryAnimator.bcolor.darkened(.05), border_width)
		return
	else:
		for j in current_year:
			#print('draw ', j)
			for idx in historic_poly_cache[Data.years[j]]:
				var poly=historic_poly_cache[Data.years[j]][idx]
				draw_polyline(poly, $HistoryAnimator.bcolor.darkened(.05), border_width)


func add_historic_districts(year, data):
	var tmp:PoolVector2Array 
	#print('ahd', historic_poly_cache.keys())
	historic_poly_cache[Data.years[current_year]]={}
	#print(current_year,' added')
	#var nodesadded=0
	for i in data.keys():
		if data[i][0].size() > 0:
			tmp=merge_poly(data[i])
			#tmp.hide() #show the polys after animation is done
			#tmp.show_behind_parent=true
			#year
		#if i+'history') in histo:
			#remove_child(get_node(i+'history'))
			#print('freeing '+i+'history to add next iteration of same district')
		#	get_node(i+'history').free()
		if tmp!=null and len(tmp)!=0:
			add_label(i, CD.position+CD.get_node(data[i][0][0]).position, 'dlabels'+ year)
			historic_poly_cache[Data.years[current_year]][i+'history']=tmp
		#else:
		#	print(year," disolved ",i)
	#print(year, ' added ', historic_poly_cache.keys())

func clear_map():
	border_color=Color.transparent
	for dx in CD.get_children():
		dx.set_meta('color',Color.transparent)
	update()

var history_stopped_pressed:=false
var history_pause_pressed:=false
func _on_History_pressed():
	reset()
	clear_map()
	$HUD/Timeline.show()
	$Label.show()	
	$Label.text=Data.years[current_year].substr(0,4)#uiScore.text
	$HUD/Timeline.bbcode_text='[color=yellow]'+Data.years[current_year]+'[/color]'
	current_year=0
	history_stopped_pressed=false
	history_pause_pressed=false
	uiScore.visible=true
	uiScore.text=Data.years[current_year].substr(0,4)
	# generate historic districts and labels and add to group. group name is year string
	add_historic_districts(Data.years[current_year], Data.history[0])
	# print('after ahd', current_year)
	# setup data for transition animation
	# using karur as proxy center of the state from where the initial 12 districts appear
	var old=[{node=CD.get_node('Karur'),loc=center('Karur')}] #d['Karur']}]
	var newlist=[]
	var names=[]
	for n in historic_poly_cache[Data.years[current_year]]:#get_tree().get_nodes_in_group(years[current_year]):
		#print(n)
		names.append(n.replace('history',''))
		newlist.append({node=historic_poly_cache[Data.years[current_year]][n], loc=center(  name(n) )})
	#print('anim setup ready')
	$HistoryAnimator.start(old, newlist)
	# HistoryControl ie stop button is shown only after animation starts
	$HUD/Top/HistoryControl.show()
	$HUD/Top/HistoryControl/PlayPause.show()
	$HUD/Top/HistoryControl/PlayPause.text="Pause"
	$HUD/Top/HistoryControl/PlayPause.pressed=false
	yield($HistoryAnimator, "move_complete")
	#print('init anim move complete')
	game_in_progress=2
	border_color=$HistoryAnimator.bcolor
	border_width=4
	update()
	add_to_dist_timeline(names)
	# wait for a bit before next step
	yield(get_tree().create_timer(1.0), "timeout")
	# borders have been updated redraw
	current_year=current_year+1
	
	while history_stopped_pressed==false and history_pause_pressed==false:
		if current_year>=len(Data.years):
			quit_history_mode()
			return
		history_next_animate()
		#yield($HistoryAnimator, "move_complete")
		#get_tree().call_group(years[current_year],"show")
		#!!get_tree().call_group('dlabels'+years[current_year],"show")
		#borders will be drawn for current year -1
		#update() # TODO very delicate since its tied to current_year-1
		update()
		yield(get_tree().create_timer(2.0), "timeout")
		current_year=current_year+1
	# NB: previously quit history mode was being called inside history stop handler 
	# this was causing a race condition on variable current_year (both the while loop code and quit hmode shouldnt run simultainiously). 
	# now while loop is allowed to complete the quit hmode is called 
	if history_stopped_pressed:
		quit_history_mode()

func history_next_animate():
	#get_tree().call_group("dlabels"+years[current_year-1],"queue_free")
	for tmpx in get_tree().get_nodes_in_group("dlabels"+Data.years[current_year-1]):
		tmpx.get_parent().queue_free()
	add_historic_districts(Data.years[current_year], Data.history[current_year])
	uiScore.text=Data.years[current_year].substr(0,4)
	$Label.text=Data.years[current_year].substr(0,4)
	$HUD/Timeline.append_bbcode('\n[color=yellow]'+Data.years[current_year]+'[/color]')
	var names=[]
	var newlist=[]
	var key=Data.history[current_year].keys()[0]
	var old=[{loc=center(name(key))}]
	for n in historic_poly_cache[Data.years[current_year]]:#get_tree().get_nodes_in_group(years[current_year]):
		names.append(n.replace('history',''))
		newlist.append({node=historic_poly_cache[Data.years[current_year]][n], loc=center(name(n))})
	$HistoryAnimator.start(old, newlist)
	add_to_dist_timeline(names)

func history_next():
	#get_tree().call_group("dlabels"+years[current_year-1],"queue_free")
	for tmpx in get_tree().get_nodes_in_group("dlabels"+Data.years[current_year-1]):
		tmpx.get_parent().queue_free()	
	add_historic_districts(Data.years[current_year], Data.history[current_year])
	uiScore.text=Data.years[current_year].substr(0,4)
	$Label.text=Data.years[current_year].substr(0,4)
	$HUD/Timeline.append_bbcode('\n[color=yellow]'+Data.years[current_year]+'[/color]')
	var names=[]
	for n in historic_poly_cache[Data.years[current_year]]:
		names.append(n.replace('history',''))
	add_to_dist_timeline(names)

var histcache:={}
func get_history(dd):
	var cur_year=0
	var text:=''
	if dd in histcache:
		return histcache[dd]
	while true:
		if cur_year>=len(Data.years):
			histcache[dd]=text
			return text
		if dd in Data.history[cur_year]:
			if cur_year==0:
				text='Created in ' + Data.years[cur_year] +'\n'
			else:
				text=text+'Divided in '+ Data.years[cur_year] + ' with '
				var tmp=Data.history[cur_year].keys().duplicate()
				tmp.erase(dd)
				text=text +' '+ str(tmp).replace('[','').replace(']','') +'\n'
		cur_year=cur_year+1
		
var seconds:=0
var timedquiz:=false
func _on_QuizTimer_timeout():
	seconds=seconds+1
	$HUD/TopRight/Clock.text=str(seconds)

func showstack():
	for i in get_stack():
		print(i.function, i.line)

func appear():
	#print("==>>")
	#showstack()
	tw.interpolate_property($HUD/Grid, "rect_position:x", -$HUD/Grid.rect_size.x, 0,.3)
	tw.start()

func infogrid_disappear():
	#var tmpx=$HUD/Grid.rect_size.x
	#print("<<==")
	#showstack()
	tw.interpolate_property($HUD/Grid, "rect_position:x", 0,-$HUD/Grid.rect_size.x,.3)
	tw.start()
	yield(tw,"tween_completed")
	#$HUD/Grid.hide()
	#$HUD/Grid.rect_position.x=0


func _on_Quest_pressed():
	$HUD/StartScreen.hide()
	$Gopal.show()
	$HUD/TopRight/Labels.show()
	#$HUD/TopRight/LabelCities.show()
	if selected_district!='':
		deselect()
		get_tree().set_group("dlabels","visible",false)
	quest_selected('')

var quest_colors={
	sea=Color.skyblue,
	river=Color.darkcyan,
	mountains=Color.sienna,
	food=Color.plum,
	people=Color.seagreen,
	culture=Color.gold,
	movies=Color.indigo
}
var general_quests=['', 'mountains', 'river', 'sea']

func quest_selected(districts, quest_name=''):
	# district is empty string - quest button pressed 
	#if array quest selected via multiquest
	if districts is Array:
		for i in districts:
			setDistrict_Color_Text(i, quest_colors[quest_name], false)
		yield(get_tree().create_timer(4.0), "timeout")
		$HUD/QMenu/PopupPanel.hide()
		$HUD/QMenu.hide()
	$HUD/Grid/MarginContainer/Neighbours.visible=false
	$HUD/Grid/MarginContainer/history.visible=false
	$HUD/Grid/MarginContainer/Back.visible=false
	$HUD/Grid/MarginContainer/Muni.hide()
	uiScore.visible=true
	uiScore.text='Check the InfoBox for Instructions'
	$HUD/TopRight/Labels.show()
	game_in_progress=3
	if general_quests.has(quest_name):
		appear()
		$HUD/Grid.reload(districts, '', '', 0)
	else:
		appear()
		$HUD/Grid.reload(districts, '', '', 0,quest_name[0])
		
func _on_Timed_pressed():
	reset()
	game_in_progress=1
	uiScore.text=str(score)
	uiScore.visible=true
	$HUD/TopRight/Clock.show()
	$HUD/Message.show()
	timed_msg("[pulse color=#44dd22 height=-15 freq=5]You have 10 turns\nFind the Districts![/pulse]",2)
	yield($Timer,"timeout")
	new_challenge()
	timedquiz=true
	$QuizTimer.start()

func _on_CityQuiz_pressed():
	reset()
	game_in_progress=4
	uiScore.text=str(score)
	uiScore.visible=true
	#$HUD/TopRight/Clock.show()
	$HUD/Message.show()
	CD.input_pickable=false
	timed_msg("[pulse color=#44dd22 height=-15 freq=5]You have 10 turns\nFind the District given a City name![/pulse]",2)
	yield($Timer,"timeout")
	new_city_challenge()
	CD.input_pickable=true
	#timedcityquiz=true
	#$QuizTimer.start()

#when player node moves into area 
func showinfo(district, transition):
	if transition == selectionType.new:
		appear()
	if game_in_progress==3:
		uiScore.visible=false
		#appear()
		$HUD/Grid.reload(district, '', '', 1)
	else:
		# non quest just show info without clue
		uiScore.visible=false
		#appear()
		$HUD/Grid.reload(district, neighbours(district), get_history(district), 2)

func _on_quest_over(turnstaken, cluessolved, success):
	CD.input_pickable=false
	$HUD/Grid/MarginContainer/Neighbours.visible=true
	$HUD/Grid/MarginContainer/history.visible=true
	$HUD/Grid/MarginContainer/Back.visible=true
	$HUD/Grid/MarginContainer/Muni.show()
	$HUD/Grid.hide()
	infogrid_disappear()
	uiScore.visible=false
	$HUD/Message.show()
	if success:
		timed_msg("[pulse color=#22dd44 height=-15 freq=7]Congrats! Quest Complete. You took "+str(turnstaken)+" turns\nAnd solved "+str(cluessolved)+" clues! Next Quest has been Unlocked.[/pulse]",3)
	else:
		timed_msg("[pulse color=#22dd44 height=-15 freq=5]You took "+str(turnstaken)+" turns\nAnd solved "+str(cluessolved)+" clues![/pulse]",3)
	yield($Timer,"timeout")
	$HUD/Message.bbcode_text=''
	#if multiquest:
	#	multiquest=false
	#quest_in_progress=false
	game_in_progress=0 # revert back to explore mode
	#reset score border
	uiScore["custom_styles/normal"].border_color="feed5f"#selected_color_right
	uiScore["custom_colors/font_color"]="feed5f"#selected_color_right
	#enableui()
	CD.input_pickable=true
	game_over()

func _off_track(dx):
	uiScore.visible=true
	uiScore.text="Press CLUE if you need more hints"
	uiScore["custom_styles/normal"].border_color=Color.red
	uiScore["custom_colors/font_color"]=Color.red
	#get_node("Districts/"+dx).color=selected_color_wrong
	setDistrict_Color_Text(dx,selected_color_wrong, false)

func _on_Grid_show_neighbours(show):
	if show:
		if selected_district == "" or selected_district==null:
			return
		for i in neighbours(selected_district):
			setDistrict_Color_Text(i,deselect_color.blend("79e9a5"),true)
	else:
		for district in CD.get_children():
			if selected_district == "" or selected_district==null:
				setDistrict_Color_Text(district.name,deselect_color, false)
			else:
				if district.name != selected_district:
					setDistrict_Color_Text(district.name,deselect_color, false)


func _on_Grid_on_track(d):
	#$HUD/Score.text="Well done!\nYou are on track"
	#$HUD/Score["custom_styles/normal"].border_color=selected_color_right
	#$HUD/Score["custom_colors/font_color"]=selected_color_right
	#get_node("Districts/"+d).color=selected_color_right
	setDistrict_Color_Text(d,selected_color_right, false)

#var multiquest=false
func subjectQuest():
	$HUD/StartScreen.hide()
	$HUD/TopRight/Labels.hide()
	$Gopal.show()
	if selected_district!='':
		deselect()
		get_tree().set_group("dlabels","visible",false)
	$HUD/QMenu.show()

func _on_Explore_pressed():
	$Gopal.show()
	calculate_lable_layout()
	$HUD/TopRight/Labels.show()
	$HUD/Top/LabelCities.show()
	var randstartidx=rng.randi_range(0,CD.get_child_count()-1)
	var startat = CD.get_child(randstartidx).name
	$Gopal.path.append(startat)
	#gen_dneighbours()
	gotoDistrict()
	# multiplayer test
	for i in minion_count:
		var sss=P.instance()
		sss.scale=Vector2(0.3,0.3)
		sss.speed=rng.randi_range(60, 100)
		sss.monitorable=true
		sss.monitoring=false
		sss.input_pickable=false
		sss.modulate=Color.orangered
		sss.name='ss'+str(i)
		randstartidx=rng.randi_range(0,len(Data.Cities)-1)#get_child_count()-1)
		#sss.place_at(CD.position + CD.get_child(randstartidx).position)
		add_child(sss)
		sss.goto(Data.Cities[randstartidx].position, Data.Cities[randstartidx].district)
		sss.connect("waiting_for_orders", self,"_give_minion_new_destination", [sss])

var minion_count=4
func _give_minion_new_destination(m:Area2D):
	#print(m.name, m.heading)
	var randidx=rng.randi_range(0,len(Data.Cities)-1)
	m.goto(Data.Cities[randidx].position, Data.Cities[randidx].district)
		
func _on_infobox_exit():
	$HUD/Grid.clear_infobox_cities()
	$Cities.clear()
	for i in get_children():
		if i.name.begins_with('ss'):
			i.queue_free()
	game_over()

func _on_LabelCities_item_selected(index):
#	if index!=0:
#		get_tree().call_group("allcities","hide")
#		get_tree().call_group(citygrades[index],"show")
#	else:
#		get_tree().call_group("allcities","hide")
	$Cities._draw_cities('all', Data.citygrades[index])

# Handles 2 states either while loop is running and quit button is pressed
# NextPrev non while loop code is running and quit button is pressed
func _on_HistoryStop_pressed():
	history_stopped_pressed=true
	if history_pause_pressed:
		quit_history_mode()
	
func quit_history_mode():
	#update()
	historic_poly_cache.clear()
	game_in_progress=0 #stops the draw
	$HUD/Timeline.hide()
	$HistoryAnimator.stop()
	for i in range(0,len(Data.years)):
		#get_tree().call_group(years[i],"hide")
		#get_tree().call_group("dlabels"+years[i],"hide")
		for tmpx in get_tree().get_nodes_in_group("dlabels"+Data.years[i]):
			#print('freeing ', tmpx.get_parent())
			tmpx.get_parent().queue_free()
			#else:
			#	print('not freeing', tmpx.name)	
	#print('after queue free ***********', get_tree().get_node_count())
	current_year=0
	uiScore.visible=false
	$Label.hide()
	$HUD/Top/HistoryControl.hide()
	border_color=deselect_color.darkened(.1)
	update()
	$HUD/Top/R1/Next.hide()
	$HUD/Top/R1/Previous.hide()
	game_over()

func _on_PlayPause_toggled(button_pressed):
	history_pause_pressed=button_pressed
	if button_pressed:
		$HUD/Top/HistoryControl/PlayPause.hide() # until resume is implemented
		$HUD/Top/R1/Next.show()
		$HUD/Top/R1/Previous.show()
	else:
		#$HUD/Top/HistoryControl/PlayPause.text="Pause"
		$HUD/Top/R1/Next.hide()
		$HUD/Top/R1/Previous.hide()

func _on_Next_pressed():
	if current_year>=len(Data.years):
		quit_history_mode()
		return
	history_next()
	#get_tree().call_group("dlabels"+years[current_year],"show")
	update()
	current_year=current_year+1

const MAX_COORD = pow(2,31)-1
const MIN_COORD = -MAX_COORD
var polybounds

func minv(curvec,newvec):
	return Vector2(min(curvec.x,newvec.x),min(curvec.y,newvec.y))
func maxv(curvec,newvec):
	return Vector2(max(curvec.x,newvec.x),max(curvec.y,newvec.y))

func get_bounds(polygon):
	var min_vec = Vector2(MAX_COORD,MAX_COORD)
	var max_vec = Vector2(MIN_COORD,MIN_COORD)
	for v in polygon:
		min_vec = minv(min_vec,v)
		max_vec = maxv(max_vec,v)
	return Rect2(min_vec, max_vec-min_vec)

var pt=preload("res://Point.tscn")
var P=preload("res://Player.tscn")

func _on_Grid_show_munis(district):
	#TODO dont redraw if pressed again and again
	$HUD/Grid/VBoxContainer/PanelContainer/imgbox.hide()
	var p = CD.get_node(district).polygon
	var origin=CD.position + CD.get_node(district).position
	#print('origin ', origin)
	#print(p)
	var pb=get_bounds(p)
	#print('bounds of p ',pb.size.x, pb.size.y)
	var ib=$HUD/Grid/VBoxContainer/PanelContainer.rect_size
	#print('infobox rect ',ib.x, ib.y)
	$HUD/Grid/VBoxContainer/PanelContainer/Map.scale=Vector2(ib.x/pb.size.x, ib.y/pb.size.y)
	$HUD/Grid/VBoxContainer/PanelContainer/Map.visible=true
	$HUD/Grid/VBoxContainer/PanelContainer/Map.polygon=p
	$HUD/Grid/VBoxContainer/PanelContainer/Map.color=deselect_color
	for c in $Cities.of[district]:#get_tree().get_nodes_in_group(district):
		#print( c.name,' ', c.position)
		#print(c.position-origin)
		var city=pt.instance()
		city.name=c.name
		city.radius=c.radius#20/citygrades.find(c.group)
		var citypos= c.position - origin
		city.position = Vector2(citypos.x*ib.x/pb.size.x, citypos.y * ib.y/pb.size.y)
		city.z_index=3
		$HUD/Grid/VBoxContainer/PanelContainer.add_child(city)


func _on_ClickDetector_area_shape_entered(area_id, area, area_shape, local_shape):
	#print(area_id,' ', area.name,' ', area_shape,' ', local_shape)
	if area.name!='Gopal':
		var o=CD.shape_find_owner(local_shape)
		#print(area.name, ' entered ',CD.get_child(o).name)
		CD.get_child(o).set_meta('color',area.modulate)
		update()
