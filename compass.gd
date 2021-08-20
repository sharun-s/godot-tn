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

func _ready():
	$HUD/N.connect("toggled", self, "_compass_toggled", ["North"])
	$HUD/S.connect("toggled",self, "_compass_toggled", ["South"])
	$HUD/E.connect("toggled",self, "_compass_toggled", ["East"])
	$HUD/W.connect("toggled",self, "_compass_toggled", ["West"])

func _on_TN_ready():
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