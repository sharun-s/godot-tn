extends GridContainer
var facts:={
		Ariyalur=['prehistoric fossils','Gangaikondacholapuram'],
		Chennai=["State Capital", "Marina Beach"],
		Chengalpattu=[
			"Named after the Sengazhuneer poo (Red White Lily) that grows in abundance along the river banks",
			"Mahaballipuram site of some of the earliest Rock Temples and Stone Sculpture that influenced the style of Temple Architecture throughout South India"],
		Coimbatore=[
			'Eastern end of the Palakkad Gap, the lowest pass through the Western Ghats linking Kerala and Tamil Nadu. Also called Kovai',
			'Manchester of South India due to extensive textile industry, fed by the surrounding cotton fields'
		],
		Cuddalore=[
			'Nataraja dance at thilai Natyanjali Dance Festival feb march on mahashivratri expand...',
			'Pichawaram mangroves',
		'Koodalur means confluence in Tamil. It is the place where the Pennaiyar, Kedilam, Paravanar and Uppanaar rivers join',
		'Ports, Beaches, fishing villages','Was known as Naadu Nadu or the middle kingdom betweene Cholas in the South and the Pallavas in the North', 
		"Fort St David in Cuddalore was one of the main British trading posts controling their activities in South India in the early 1700. So Cuddalore became the site of multiple wars with the French based 25kms North in Pondicherry",
		"Silver Beach is one of the longest beaches found on the Coromandel Coast. 2700 people lost their life here during the 2004 Tsunami", 'Chidambaram temple','Pichawaram Mangrove forests'],
		Dindigul=['Famous Kodaikanal hill station'],
		Dharmapuri=["Hogenakkal falls"],
		Erode=[
			"Turmeric",
			"Agri powerhouse due to rivers and dams",
			"Sathyamangalam Tiger Reserve 83 tigers and 111 Leopards"
		],
		Kanyakumari=["Nanjilnadu cuisine Puttu, Appam, Idiappam, Seafood, Coconut oil based",
			"Southern most district of TN and the Indian main land",
			"Nagarcoil is the District HQ",
			"The only district of TN facing the Arabian Sea"],
		Kanchipuram=[
			"District HQ is Kanchipuram also known as the City of a Thousand Temples",
			"Capital of the Panllava Kingdom from the 4th to the 9th Century",
			"Headquarters of the Kanchi matha, founded by Adi Sankaracharya",
			"Famous for the hand woven Kanchipuram Silk Saree. Wedding saree being a speciality",
			"Ekambareswarar Temple covers 25 acres is one of the largest temple complexes in India. The Southern Gopuram is 11 stories tall making it one of the taller temple towers. Showcasing the architecture of the Vijayanagara dynasty",
			"Kailasanathar Temple and the Vaikunta Perumal Temple found here are nearly 1350 years old"
		],
		Krishnagiri=[
			"Largest producers of Mangoes in India"
		],
		Kallakurichi=[
			'Mainly a rural area 50 years ago increased road connectivity has turned into an emerging agricultural hub.',
			'The Kalvarayan Hills are pristine unexplored area with the Vellimalai hilltop becoming a popular tourist spot for locals during the monsoon season.'],
		Karur=["Capital of the Chera Kings"],
		Perumbalur=['Leads the state in Small Onion production'],
		Pudukotai=['Was a independent princely state ruled by the Thondaimans since the 17th century'],
		Mayiladithurai=[ 'Ancient Port town of Poombuhar where the Kaveri meets the sea '],	
		Madurai=['Chithirai Festival',
			'jigarthanda, muttaiparotta (minced parotta and scrambled egg), paruthipal (made of cottonseeds), Karidosai (dosai with mutton) & ennaidosai',
			'The Meenakshi Amman Temple is one of the largest temple complexes in the state with 14 Gopurams (Gateway Towers), 33000 scupltures, a thousand pillared hall, tank legend, parrots...',
			'Many areas well known for conducting the Jallikattu (bull taming) ceremony during the Pongal (harvest festival) season',
			'Jasmine (Madurai Malli)'
		],
		Nagapattinam=['Sambandar of Sirkazhi and the Jains - Thirumarai ', 'Velankanni festival', 'Was hit by the 2004 Tsunami 6000 lives lost', 'Danish Fort' ],
		Nilgiris=[
			'coffee, tea, rubber, eucalyptus plantaination',
			'Mudumalai Tiger Reserve is the largest in TN with 160 using the corridor and 103 resident ' ],
		Namakkal=['Cauvery flows thro, Tiruchengode...',
		'Known for its Poutry Farms and  Lorry body building industry', 
		'Its name derives from Namagiri, the name of the single 65m high rock formation at the center of the Namakkal town. A Fort covering one and half acres was built on top of the rock in the 17th century'],
		Ranipet=['Ceramics'],
		Ramanathapuram=[
			"Birth place of A.P.J Abdul Kalam, rocket man, pokhran 2, peoples president...",
			"Hi! I am Abdul. Welcome to Pamban Island",
			'According to legend the site from which Ramas Army builds a bridge over the ocean to Lanka',
			"Mandapam - Pamban Bridge - Pamban-Rameshwaram/Dhanushkodi",
			"In 1964 a cyclone hit Pamban Island with 25 ft waves washing away the town of Danushkodi. Today the remain of the ghost town are a tourist attraction."
		],
		Salem=['Steal industry', 
		'Shevaroy Hills - yercaud - orchidarium - old coffee plantations highest peak of the southern eastern ghats in TN - lots of species of snake, lizard, frogs and birds not found anywhere else'],
		Sivagangai=['Kaniyan - Yaadhum Oore Yaavarum Kelir',
			'Chettinad formed by a prosperous banking and business community built from trading with Burma, Ceylon and Malaysia',
			'Athangudi tiles', 
			'Known for the famous Chettinad cuisine',
			'Found here is the 2500 year old Keezhadi excavation site, including plates with the Tamil-Brahmi script'
		],
		Theni=['Indian Neutrino Observatory',
		'Meghamalai Wildlife Sanctuary'],
		Tiruvarur=[
			'Somaskanda iconography',
			'Thyagaraja Temple Chariot found here stands 96 feet tall',
			'Birthplace of Saint Thyagaraja, the composer of Carnatic music'	
		],
		Thanjavur=[
			"The Rice Bowl of Tamil Nadu",
			"Made popular Ghee Pongal, Puliyodarai (tamarind rice)",
			"Kumbakonam, every 12 years Mahamaham festival draws millions of devotees for a dip in the huge temple tank complex spanning 20 sq acres",
			"The 1000 year old Brihadeshwara temple",
			"Seat of the Chola Empire",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Tirunelveli=["Halwa"],
		Tiruvannamalai=[
			"Arunachala hill, deepam festival",
			"Arni silk production",
			"Largest Rice producers"
		],
		Tiruvallur=['Sarvepalli Radhakrishnan was born in Tiruttani',
		'Pulicat town found at the tip of Pulicat Lake',
		'casuarinas','Tiruttani Murgan temple - Aadi Krittikai - kavadis',
		'Very industrialized district manufacturing everything from cycles, tanks to trains'],
		Thoothukudi=["ISRO is building its new space port here at Kulasekharapatnam ","Known in the past as the Pearl Fishery Coast", 
		"Veerapandiya Kattabomman","great poet Subramanya Bharathi",
		"V.O.Chidambaram Pillai Swadeshi Steamship Company",
		"dugong sea grass medows"],
		Tiruppur=["Textile export hub"],
		Tirupathur=['Surrounded by the Javadhu and Yelagiri Hills known for rivers, waterfalls and sandal wood trees'],
		Tiruchirapalli=['The Srirangam temple complex covers 156 acres making it the largest templex complex in the country. Famous for festivals conducted throughout the year', 
		'Rockfort Temple'],
		Tenkasi=['Old Courtallam Falls', 'Thirukutralam'],	
		Vilippuram=["Pondicherry, Auroville ",
			"Gingee Fort is found here. Sivaji called it the most impregnable fortress in India"
		],
		Virudhunagar=[
			"Birth place of K. Kamaraj TN CM from 54-63, and Indian National Congress President after Jawaharlal Nehru's death. He made education free for the poor having had to drop out of school at age 11 to support his family",
			'Sivakasi Fireworks',
			'The 192 ft Gopuram of the Srivilliputhur Temple built here, dedicated to Andal the only female among the poet saints of south india, is the symbol of the Tamil Nadu Govt'
		],
		Vellore=[
			"The famous Ambur biryani, thanks to Mughal influence from the mughal court of the Nawab of Arcot",
			"Top exporter of finished Leather goods in the country",
			"500 year old Vellore Fort is a popular tourist attraction. Was location of the 1806 Sepoy Mutiny against the British"
		]
	}

signal quest_over;	
signal off_track;	
signal show_neighbours;

func sea():
	var a:AnimatedTexture = AnimatedTexture.new()
	a.frames=10
	a.fps=2
	for i in range(1,11):
		a.set_frame_texture(i-1, load("res://sea_"+str(i)+".png"))
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
		a.set_frame_texture(i-1, load("res://panther_"+str(i)+".png"))
	return a

var dummyimg=[
	panther(),
	preload("res://nat.png"),
	preload("res://elephant.png"),
	preload("res://flame.png"),
	sea(),
	preload("res://kolam.png"),
	#preload("res://dugong.png"),
	#preload("res://paddy.png"),
	#preload("res://temple.png"),
	#preload("res://templecar.png"),
	#preload("res://handloom.png"),
	]
# Called when the node enters the scene tree for the first time.
func _ready():
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
var NumberOfTargets:=3
var AttemptsAllowed:=10
var attempts:=AttemptsAllowed

func reload(district, neighbours, hist='',mode=state.NON_QUEST):
	n.clear()
	historytext=hist
	n=neighbours
	$VBoxContainer/NameBox.text=district
	$VBoxContainer/PanelContainer/imgbox.texture=dummyimg[int(rand_range(0, dummyimg.size()))]
	if mode==state.NEW_QUEST:
		rng.randomize()
		while targets.size() != NumberOfTargets:
			var idx=rng.randi_range(0, facts.size()-1)
			if (facts.keys()[idx] in targets) == false:
				targets.append(facts.keys()[idx])
		print('targets set', targets)
		$VBoxContainer2/MarginContainer/clue.show()
		_on_clue_pressed()
	elif mode==state.IN_QUEST:
		attempts=attempts-1
		if targets[0] == district:
			targets.pop_front()
			print('targets left', targets)
			_on_clue_pressed("Well done. You are on track!!!\n\n")
			show()
			#emit_signal("on_track")
		else:
			show_fact(district)
			show()
			emit_signal("off_track",district)
		if attempts==0 or targets.size()==0:
			$VBoxContainer2/MarginContainer/clue.hide()
			emit_signal('quest_over',AttemptsAllowed-attempts, NumberOfTargets - targets.size()) # send clues solved
			attempts=AttemptsAllowed
			targets.clear()
	else:
		#$VBoxContainer2/MarginContainer/clue.hide()
		show_fact(district)
		show()

func show_fact(district):
	if district in facts and facts[district].size() > 0:
		var idx=rng.randi_range(0, facts[district].size()-1)
		$VBoxContainer2/FactBox.text=facts[district][idx]
	else:
		#district or fact is missing from the db
		$VBoxContainer2/FactBox.text=''

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_BACKSPACE:
			hide()

func _on_Back_pressed():
	hide()

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
	$VBoxContainer2/FactBox.text=format_neighbours()

func _on_clue_pressed(prefix=''):
	#var d=int(rand_range(0, facts.keys().size()))
	#var target=facts.keys()[d]
	if targets.size() >0:
		var idx= rng.randi_range(0, facts[targets[0]].size()-1)
		$VBoxContainer2/FactBox.text=prefix+'Head to the district known for - \n'+facts[targets[0]][idx]
	
func _on_history_pressed():
	$VBoxContainer2/FactBox.text=historytext

func _on_Neighbours_toggled(button_pressed):
	emit_signal('show_neighbours', button_pressed)
	
