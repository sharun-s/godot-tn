extends GridContainer

signal quest_over;	
signal off_track;
signal on_track;
signal show_neighbours;
signal subject_quests_ready;

func sea():
	var a:AnimatedTexture = AnimatedTexture.new()
	a.frames=10
	a.fps=2
	for i in range(1,11):
		a.set_frame_texture(i-1, load("res://pics/sea_"+str(i)+".jpg"))
	#var cnt=11
	#for i in range(10, 1, -1):
	#	a.set_frame_texture(cnt, load("res://sea_"+str(i)+".png"))
	#	cnt=cnt+1
	return a

func panther():
	var a:AnimatedTexture = AnimatedTexture.new()
	a.frames=6
	a.fps=2
	for i in range(1,7):
		a.set_frame_texture(i-1, load("res://pics/panther_"+str(i)+".jpg"))
	return a

var dummyimg=[]

func preload_from_pics_dir():
	var ts = OS.get_ticks_usec()
	var path = "res://pics"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		#elif !file_name.begins_with(".") and !file_name.ends_with(".import"):
		elif file_name.ends_with(".import"):
			#var img=load(path + "/" + file_name)
			# as per godotengine.org/qa/59637/
			# use resourceloader.load instead of load so web build is able to locate right file
			var img = ResourceLoader.load(path+"/" + file_name.replace('.import',''))
			dummyimg.append(img)
	dir.list_dir_end()
	var te = OS.get_ticks_usec()
	print('image loading took: ', te - ts, 'us')

func image_selector(district='', fact=''):
	# if fact has image return that image
	# elif district has image
	# else return random image
	return dummyimg[int(rand_range(0, dummyimg.size()))]

var filterfacts={}
# Called when the node enters the scene tree for the first time.
func _ready():
	#if OS.get_name()=='Android':
	#	$VBoxContainer2/FactBox.set("custom_fonts/font/size",24)
	rect_position.x=-rect_size.x
	var fact_stats={tot=0}
	preload_from_pics_dir()
	# facts have to be filtered by type to setup subject quests/multiquests
	# stored in filterfacts. On new subject quest facts points at relevant filterfacts
	for i in Data.facts:
		#print(i, ' ', len(facts[i]) )
		for f in Data.facts[i]:
			fact_stats['tot']+=1
			if f[1]==':':
				if f[0] in fact_stats:
					fact_stats[f[0]]+=1
					if i in filterfacts[f[0]]:
						filterfacts[f[0]][i].append(f)
					else:
						filterfacts[f[0]][i]=[f]
				else:
					fact_stats[f[0]]=1
					filterfacts[f[0]]={i:[f]}
	print(fact_stats)
	emit_signal('subject_quests_ready',filterfacts)
#	for i in ftype2district:
#		print(i)
#		for j in ftype2district[i]:
#			print('  ',j)	
	hide()# Replace with function body.

var n=[]
var historytext:=''
enum state{
	NEW_QUEST,
	IN_QUEST,
	NON_QUEST
}
var rng=RandomNumberGenerator.new()
var targets=[]
export var NumberOfTargets:=10
export var AttemptsAllowed:=20
var attempts:=AttemptsAllowed
var backupfacts
#generic_quest is true facts is not filtered by type eg people, food etc
#if false facts is stored in backuofacts and is reset with ftype
var generic_quest=true

func clear_infobox_cities():
	for k in $VBoxContainer/PanelContainer.get_children():
		if k is Polygon2D:
			k.hide() #TODO this doesnt really redraw empty poly
		elif k is TextureRect:
			k.show()
		else:
			k.free()	

func reload(district, neighbours, hist='',mode=state.NON_QUEST,ftype=''):
	show()
	#if !(district is Array):
	#	if district == '':
	#		pass
	#	else:
	#		district=district
	historytext=hist
	n=neighbours
	$MarginContainer/Neighbours.pressed=false
	clear_infobox_cities()
	randomize()
	#$VBoxContainer/PanelContainer/imgbox.texture=image_selector(district)
	if mode==state.NEW_QUEST:
		$VBoxContainer/NameBox.text="New Quest!"
		#rng.randomize()
		if district is Array:
			#method used for subject quests ie districts related to a subject are set as targets
			if district.size() > NumberOfTargets:
				targets=district.slice(0, NumberOfTargets-1)
			else:
				NumberOfTargets=district.size()
				targets=district 
			if ftype!='':
				backupfacts=Data.facts
				Data.facts=filterfacts[ftype]
				generic_quest=false
		else:
			# non multi quest ie intiated from Quest button rather than levelup
			while targets.size() != NumberOfTargets:
				rng.randomize()	
				var idx=rng.randi_range(0, Data.facts.size()-1)
				if (Data.facts.keys()[idx] in targets) == false:
					targets.append(Data.facts.keys()[idx])
			
		print('targets set', targets)
		$MarginContainer/clue.show()
		_on_clue_pressed() # to reset info box
	elif mode==state.IN_QUEST:
		attempts=attempts-1
		if targets.size() == 0: #handles case where user might cause a reload after quest is complete
			return
		if targets[0] == district:
			targets.pop_front()
			$VBoxContainer/NameBox.text="Solved:"+str(NumberOfTargets-targets.size())+'/'+str(NumberOfTargets)+" Turns:"+str(AttemptsAllowed-attempts)+'/'+str(AttemptsAllowed)
			#print('targets left', targets)
			_on_clue_pressed("Well done. You are on track!!!\n\n")
			emit_signal("on_track", district)
		else:
			$VBoxContainer/NameBox.text="Solved:"+str(NumberOfTargets-targets.size())+'/'+str(NumberOfTargets)+" Turns:"+str(AttemptsAllowed-attempts)+'/'+str(AttemptsAllowed)#district
			show_fact(district, 'Oops! Wrong direction. You are in '+district+' known for ')
			emit_signal("off_track",district)
		if attempts==0 or targets.size()==0:
			$MarginContainer/clue.hide()
			# this updates state in main TN node and in Qmenu Node. Qmenu will change quest buttons state on quest success
			emit_signal('quest_over',AttemptsAllowed-attempts, NumberOfTargets - targets.size(), targets.size()==0) 
			attempts=AttemptsAllowed
			targets.clear()
			if not generic_quest: #reset facts
				Data.facts=backupfacts
				generic_quest=true
	else:
		#$MarginContainer/clue.hide()
		$VBoxContainer/NameBox.text=district
		show_fact(district)

func show_fact(district, prefix=''):
	if district in Data.facts and Data.facts[district].size() > 0:
		#var idx=rng.randi_range(0, facts[district].size()-1)
		var idx=cycleclues(district)
		$VBoxContainer2/FactBox.text=prefix+strip_metadata(Data.facts[district][idx])
		$VBoxContainer/PanelContainer/imgbox.texture=image_selector(district)
	else:
		#district or fact is missing from the db
		$VBoxContainer2/FactBox.text=''

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_BACKSPACE:
			hide()

signal infobox_exit;
func _on_Back_pressed():
	emit_signal('infobox_exit')

func format_neighbours():
	var textstr=''
	for s in range(0, n.size(),2):
		if s+1 < n.size():
			if s+1 == n.size() -1:
				textstr=textstr+' '+n[s]+' '+n[s+1]
			else:
				textstr=textstr+' '+n[s]+' '+n[s+1]+'\n'
		else:	
			textstr=textstr+' '+n[s]
	return textstr

func _on_Neighbours_pressed():
	if n == null:
		$MarginContainer/Neighbours.pressed=false
		return
	if len(n) == 0:
		$MarginContainer/Neighbours.pressed=false
		return
	$VBoxContainer2/FactBox.text=format_neighbours()

var cluecache={}
func cycleclues(f):
	if f in cluecache:
		cluecache[f]+=1 
		return cluecache[f] % Data.facts[f].size()
	else:
		randomize()
		Data.facts[f].shuffle()		
		cluecache[f]=0
		return 0

func strip_metadata(cluestr:String):
	if cluestr[1]==':':
		return cluestr.substr(2 )
	else:
		return cluestr

func _on_clue_pressed(prefix=''):
	if targets.size() >0:
		#var idx= rng.randi_range(0, facts[targets[0]].size()-1)
		var idx=cycleclues(targets[0])
		$VBoxContainer/PanelContainer/imgbox.texture=image_selector(targets[0]) 
		#print(idx, cluecache)
		$VBoxContainer2/FactBox.text=prefix+'Head to the district known for - \n'+strip_metadata(Data.facts[targets[0]][idx])
	
func _on_history_pressed():
	if historytext==null or historytext=="":
		return
	$VBoxContainer2/FactBox.text=historytext

func _on_Neighbours_toggled(button_pressed):
	if n == null:
		$MarginContainer/Neighbours.pressed=false
		return
	if len(n) == 0:
		$MarginContainer/Neighbours.pressed=false
		return
	emit_signal('show_neighbours', button_pressed)

signal show_munis

func _on_Muni_toggled(button_pressed):
	if button_pressed:
		emit_signal('show_munis',$VBoxContainer/NameBox.text)
	else:
		clear_infobox_cities()
