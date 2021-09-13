extends GridContainer
#code facttype - p:people, f:food, m:movies, c:culture/temples/religion related, h:history 
var facts:={
		Ariyalur=[
			'h:fields of Cretaceous age marine fossils (100 millions year old) are found here shocased in the Museum at Varanavasi', 
			'h:Gangaikonda Cholapuram located here was the capital of the Chola Empire before it moved to Tanjore',
			"h:The ruins of the Chola capital and the famous Temple here are now a World Heritage site"
			],
		Chennai=[
			"State Capital with 10% of the states population", 
			"Marina Beach", 
			"Center of the Tamil Film Industry nicknamed Kollywood, as most studio were built in the Kodambakkam neighbourhood"],
		Chengalpattu=[
			'h:World heritage site of 7th century monuments, temples and caves at Mahabalipuram',
			"Named after the Sengazhuneer poo (Red White Lily) that grows in abundance along the river banks",
			"h:Mahaballipuram site of some of the earliest Rock Temples and Stone Sculpture that influenced the style of Temple Architecture throughout South India"],
		Coimbatore=[
			'Eastern end of the Palakkad Gap, the lowest pass through the Western Ghats linking Kerala and Tamil Nadu. Also called Kovai',
			'Manchester of South India due to extensive textile industry, fed by the surrounding cotton fields'
		],
		Cuddalore=[
			'c:Nataraja dance at thilai Natyanjali Dance Festival feb march on mahashivratri expand...',
			'Pichawaram mangrove forests',
			'Koodalur means confluence in Tamil. It is the place where the Pennaiyar, Kedilam, Paravanar and Uppanaar rivers join',
			#'Ports, Beaches, fishing villages',
			'h:Was known as Naadu Nadu or the middle kingdom betweene Cholas in the South and the Pallavas in the North', 
			"h:Fort St David in Cuddalore was one of the main British trading posts controling their activities in South India in the early 1700. So Cuddalore became the site of multiple wars with the French based 25kms North in Pondicherry",
			"Silver Beach is one of the longest beaches found on the Coromandel Coast. 2700 people lost their life here during the 2004 Tsunami", 
			'c:Chidambaram temple',
			'Pichawaram Mangrove forests'],
		Dindigul=[
			'Kodaikanal, in tamil translates to The Gift of the Forest, is very popular hillstation located here',
			'Palani Hills where the famous Liril commercial was shot'],
		Dharmapuri=[
			"Hogenakkal falls, which means smokey rocks, is where the river Cauvery enters Tamil Nadu",
			"Taking a ride in the local bowl shaped boats made of woven grase called a Parisal/Coracle is very popular tourist activity here",
			"p:Veeraappan, the notorious elephant poacher, sandalwood smuggler, wanted for the murder of 184 people was caught here"],
		Erode=[
			"Turmeric",
			"Agri powerhouse due to rivers and dams",
			"Sathyamangalam Tiger Reserve 83 tigers and 111 Leopards"
		],
		Kanyakumari=[
			"f:Nanjilnadu cuisine Puttu, Appam, Idiappam, Seafood, Coconut oil based",
			"Southern most district of TN and the Indian main land",
			"Nagarcoil is the District HQ",
			"The only district of TN facing the Arabian Sea",
			"The ancient Kani tribe living in the Western Ghats recently discovered tree climbing crabs in this biodiversity hotspot"],
		Kanchipuram=[
			"District HQ is Kanchipuram also known as the City of a Thousand Temples",
			"h:Capital of the Panllava Kingdom from the 4th to the 9th Century",
			"p:Headquarters of the Kanchi matha, founded by Adi Sankaracharya",
			"Famous for the hand woven Kanchipuram Silk Saree. Wedding saree being a speciality",
			"c:Ekambareswarar Temple covers 25 acres is one of the largest temple complexes in India. The Southern Gopuram is 11 stories tall making it one of the taller temple towers. Showcasing the architecture of the Vijayanagara dynasty",
			"c:Kailasanathar Temple, panamalai talagireeshwarar and the Vaikunta Perumal Temple found here are nearly 1350 years old",
			"h:Gunduperumbedu fossil bed where plant fossils from 400 million years ago, called poo-kal by locals are found in abundance"
		],
		Krishnagiri=[
			"p:Birthplace of C. Raja Gopalachari popularly known as Rajaji, the first Governor General of India and first Chief Minister of Tamil Nadu",
			"Largest producers of Mangoes in India",
			"Largest city here is Hosur 40 km from Bangalore and a major manufacturing hub",
			"The TVS 50, Indias first two seat moped was manufactured here in Hosur and was a big hit. More than 10 million mopeds being sold since."
		],
		Kallakurichi=[
			'Mainly a rural area 50 years ago increased road connectivity has turned into an emerging agricultural hub.',
			'The Kalvarayan Hills are pristine unexplored area with the Vellimalai hilltop becoming a popular tourist spot for locals during the monsoon season.',
			'The famous Koovagam festival held by the transgender community reenacts Krishna transforming into Mohini to marry a Prince Aravan'],
		Karur=[
			"h:Capital of the Chera Kings", 
			"h:A ancient trade post with the Romans who called it Karoura. They traded gold for rice. So the word rice comes from the Tamil araci", 
			"TN Newsprint and Papers Ltd TNPL located here is the largest sugarcane based paper mill in the world"
		],
		Perumbalur=[
			'h:Ranjankdui Fort built in the 17th century',
			'Arambavur hand made wood carvings. The artisans of this village are famous and their carvings have recieved a GI Tag',
			'Leads the state in Small Onion production',
			'h:The Karai badlands - a geological heritage site - were marine fossils from the Cretaceous period have been found',
			'h:An 18m long 120 million year old tree (kal-maram) found here (Sathanur Fossil Park) is evidence that the area was under a shallow sea during the Cretaceous period'],
		Pudukotai=[
			'Moi Virundhu, a tradional practice where money is raised from the community by inviting everyone for a feast',
			'Famous for its Percussinists, Manpoondia Pillai the lantern bearer, one handed kanjira, mirdangams...',
			'Narthamalai, malaiyadapatti paintings show the differences between the chola and pallava art',
			'h:Was a independent princely state ruled  by the Thondaimans since the 17th century'],
		Mayiladithurai=[ 
			'Ancient Port town of Poombuhar where the Kaveri meets the sea ',
			'Kaveri Pushkaram festival happens here every 12 yeara place where peacock dance'],	
		Madurai=['Chithirai Festival',
			'f:jigarthanda, muttaiparotta (minced parotta and scrambled egg), paruthipal (made of cottonseeds), Karidosai (dosai with mutton) & ennaidosai',
			'c:The Meenakshi Amman Temple is one of the largest temple complexes in the state with 14 Gopurams (Gateway Towers), 33000 scupltures, a thousand pillared hall, tank legend, parrots...',
			'Many areas well known for conducting the Jallikattu (bull taming) ceremony during the Pongal (harvest festival) season',
			'Jasmine (Madurai Malli)'
		],
		Nagapattinam=[
			'p:Sambandar of Sirkazhi and his opposition to the Jains, basis of the bakthi movement. Author of the Thirumarai  ', 
			'c:Velankanni festival', 
			'Was hit by the 2004 Tsunami 6000 lives lost', 
			'Danish Fort at Tarangabadi' 
		],
		Nilgiris=[
			'Mountain railway here is a World Heritage site for its ingenious engineering through a rugged, mountainous terrain',
			'Doddabetta Peak the highest point in TN at 2600m is located here',
			'Home of the native hill Toda and Badaga tribes',
			"Udhagamandalam or Ooty known as the Queen of Western Ghats is a hillstation located here. It is the district HQ.",
			'Coffee, tea, rubber, eucalyptus plantations',
			'Mudumalai Tiger Reserve is the largest in TN with 160 using the corridor and 103 resident ' ],
		Namakkal=[
			'Cauvery flows thro, Tiruchengode...',
			'Known for its Poutry Farms and  Lorry body building industry', 
			'Its name derives from Namagiri, the name of the single 65m high rock formation at the center of the Namakkal town. A Fort covering one and half acres was built on top of the rock in the 17th century'],
		Ranipet=[
			"f:The famous Ambur biryani. The Mughals ruled this region and influenced the cuisine. Unique due to local type of rice used, and cooking meat and rice together unlike other biriyanis separately",
			"f:Arcot Makkan Peda is a speciality - a flattened gulab jamun but filled with grated dry fruits soaked in sugar syrup",
			"Leather goods manufacturing hub",
			'End point of the first Passenger Railway Line built in South India in 1854 - Walajahpet-Veyasarapady (Chennai)',
			'Built on the Palar River banks, by the Nawab of Arcot, in honour of the Rani of Gingee who committed Sati after her husband Desingh died in the Battle of Gingee'
			],
		Ramanathapuram=[
			"p:Birth place of A.P.J Abdul Kalam, rocket man, pokhran 2, peoples president...",
			"Hi! I am Abdul. Welcome to Pamban Island",
			'According to legend the site from which Ramas Army builds a bridge over the ocean to Lanka',
			"Mandapam - Pamban Bridge - Pamban-Rameshwaram/Dhanushkodi",
			"In 1964 a cyclone hit Pamban Island with 25 ft waves washing away the town of Danushkodi. Today the remain of the ghost town are a tourist attraction."
		],
		Salem=[
			'Steal industry',
			'Mettur Dam, on the Cauvery river is the largest dam in the state', 
			'Shevaroy Hills - yercaud - orchidarium - old coffee plantations highest peak of the southern eastern ghats in TN - lots of species of snake, lizard, frogs and birds not found anywhere else'],
		Sivagangai=[
			'p:Kaniyan - Yaadhum Oore Yaavarum Kelir',
			'Chettinad formed by a prosperous banking and business community built from trading with Burma, Ceylon and Malaysia',
			'Athangudi tiles', 
			'f:Known for the famous Chettinad cuisine',
			'h:Found here is the 2500 year old Keezhadi excavation site, including plates with the Tamil-Brahmi script'
		],
		Theni=[
			'Cardamom estates',
			'Indian Neutrino Observatory',
			'The Meghamalai range also called the High Wavy Mountains',
			'Meghamalai Wildlife Sanctuary'],
		Tiruvarur=[
			'c:Somaskanda iconography - Idols depict Murugan with Shiva and Parvathi',
			'c:Thyagaraja Temple Chariot found here stands 96 feet tall',
			'p:Birthplace of Saint Thyagaraja, the composer of Carnatic music'	
		],
		Thanjavur=[
			'Netti Workds',
			"The Rice Bowl of Tamil Nadu",
			"Popularized Ghee Pongal and Puliyodarai (tamarind rice)",
			"c:Kumbakonam, every 12 years Mahamaham festival draws millions of devotees for a dip in the huge temple tank complex spanning 20 sq acres",
			"p:Srinivasa Ramanujam, untrained in maths, turned out to be one of the greatest Mathematicians of all time, grew up here in Kumbakonam",
			"c:The 1000 year old Brihadeshwara temple",
			"h:Seat of the Chola Empire and now a World Heritage site",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Tirunelveli=[
			"f:Halwa", 
			"Kudrevatti", 
			"ISROs Rocket Engines are assembled and tested at Mahendragiri located here",
			"p:Agastyamalai mountain is a popular pilgrimage site to Sage Agastya considered father of the Tamil Language",
			"Kalakkad Mundanthurai Tiger Reserve (KMTR) wildlife include Lion tailed Macaques, Elephants, Tigers, Peacock, Nilgiri Langur, Gaur amd Leopards"],
		Tiruvannamalai=[
			"Arunachala hill, deepam festival",
			"Arni silk production",
			"Largest Rice producers"
		],
		Tiruvallur=[
			'p:Sarvepalli Radhakrishnan was born in Tiruttani',
			'Pulicat town found at the tip of Pulicat Lake',
			'casuarinas',
			'c:Tiruttani Murgan temple - Aadi Krittikai - kavadis',
			'Very industrialized district manufacturing everything from cycles, tanks to trains'],
		Thoothukudi=[
			"ISRO is building its new space port here at Kulasekharapatnam ",
			"Known in the past as the Pearl Fishery Coast", 
			"p:Veerapandiya Kattabomman",
			"p:great poet Subramanya Bharathi",
			"p:V.O.Chidambaram Pillai Swadeshi Steamship Company",
			"dugong sea grass medows"],
		Tiruppur=[
			"Hosiery products. Famously called the Baniyan City or Dollar City for its textile exports", 
			"Half of Indias knitwear, innerwear exports to global brand names comes from here employing more than a 11 lak people",
			"Coins from 2000 years ago found here in Kodumanal, indicate cotton trade route with Rome"],
		Tirupathur=[
			'The Vainu Bappu Observatory one of the main centers of Indian Astronomy',
			'Surrounded by the Javadhu and Yelagiri Hills known for rivers, waterfalls and sandal wood trees'
			],
		Tiruchirapalli=[
			'p:Ramanuja and the Bhakti movement. His mummified body preserved in Ranganthaswamy temple srirangam',
			'c:The Srirangam temple complex covers 156 acres making it the largest templex complex in the country. Famous for festivals conducted throughout the year', 
			'Kallanai also known as the Grand Anicut across the Cauvery river is the oldest dam in the country that is still in use. Built nearly 2000 years ago.',
			'c:Rockfort Temple'],
		Tenkasi=[
			'm:Sunflower fields of Sundarapandipuram village shot to fame after films like Roja and Aniyan were shot here', 
			'Courtallam Falls - locals believe bathing under these waterfalls cures many ailments as the water passes through herbal forests',
			"Known as the Kashi (Varanasi) of the South, its surrounded by the western ghats on three sides and is famous for its monsoon showers, known as Saaral season",
		],	
		Vilippuram=[
			"Surrounds the union teritory of Pondicherry",
			"h:National Fossil Wood Park at Tiruvakkarai has fossilized trees that are nillions of years old",
			"h:Gingee Fort is found here. Sivaji called it the most impregnable fortress in India"
		],
		Virudhunagar=[
			"p:Birth place of K. Kamaraj TN CM from 54-63, and Indian National Congress President after Jawaharlal Nehru's death. He made education free for the poor having had to drop out of school at age 11 to support his family",
			'Sivakasi Fireworks',
			'c:The 192 ft Gopuram of the Srivilliputhur Temple built here, dedicated to Andal the only female among the poet saints of south india, is the symbol of the Tamil Nadu Govt'
		],
		Vellore=[
			"Top exporter of finished Leather goods in the country",
			"h:500 year old Vellore Fort is a popular tourist attraction. Was location of the 1806 Sepoy Mutiny against the British"
		]
	}

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
	#panther(),
	preload("res://panther_3.png"),
	preload("res://nat.png"),
	preload("res://elephant.png"),
	preload("res://flame.png"),
	sea(),
	preload("res://dance.png"),
	preload("res://kolam.png"),
	preload("res://dugong.png"),
	#preload("res://paddy.png"),
	#preload("res://temple.png"),
	#preload("res://handloom.png"),
	preload("res://kaveri.png"),
	preload("res://templegopuram.png"),
	preload("res://athangudi.png"),
	preload("res://chariot.jpg"),
	preload("res://saree.png"),
	preload("res://saree-2.png"),
	preload("res://zari.png"),
	preload("res://croc.png"),
	preload("res://beach.png"),
	preload("res://fisherman.png"),
	preload("res://marigold.png"),
	preload("res://gingee.png"),
	preload("res://lights.png")
	]

var filterfacts={}
# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name()=='Android':
		$VBoxContainer2/FactBox.set("custom_fonts/font/size",24)
	var fact_stats={tot=0}
	for i in facts:
		for f in facts[i]:
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
var NumberOfTargets:=5
var AttemptsAllowed:=10
var attempts:=AttemptsAllowed
var backupfacts
#generic_quest is true facts is not filtered by type eg people, food etc
#if false facts is stored in backuofacts and is reset with ftype
var generic_quest=true

func reload(district, neighbours, hist='',mode=state.NON_QUEST,ftype=''):
	show()
	historytext=hist
	n=neighbours
	$VBoxContainer2/MarginContainer/Neighbours.pressed=false
	randomize()
	$VBoxContainer/PanelContainer/imgbox.texture=dummyimg[int(rand_range(0, dummyimg.size()))]
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
				backupfacts=facts
				facts=filterfacts[ftype]
				generic_quest=false
		else:
			# non milti quest ie intiated from Quest button rather than levelup
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
			$VBoxContainer/NameBox.text="Solved:"+str(NumberOfTargets-targets.size())+'/'+str(NumberOfTargets)+" Turns:"+str(AttemptsAllowed-attempts)+'/'+str(AttemptsAllowed)
			#print('targets left', targets)
			_on_clue_pressed("Well done. You are on track!!!\n")
			emit_signal("on_track", district)
		else:
			$VBoxContainer/NameBox.text=district
			show_fact(district)
			emit_signal("off_track",district)
		if attempts==0 or targets.size()==0:
			$VBoxContainer2/MarginContainer/clue.hide()
			# this updates state in main TN node and in Qmenu Node. Qmenu will change quest buttons state on quest success
			emit_signal('quest_over',AttemptsAllowed-attempts, NumberOfTargets - targets.size(), targets.size()==0) 
			attempts=AttemptsAllowed
			targets.clear()
			if not generic_quest: #reset facts
				facts=backupfacts
				generic_quest=true
	else:
		#$VBoxContainer2/MarginContainer/clue.hide()
		$VBoxContainer/NameBox.text=district
		show_fact(district)

func show_fact(district):
	if district in facts and facts[district].size() > 0:
		var idx=rng.randi_range(0, facts[district].size()-1)
		$VBoxContainer2/FactBox.text=strip_metadata(facts[district][idx])
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
	if n == null:
		$VBoxContainer2/MarginContainer/Neighbours.pressed=false
		return
	if len(n) == 0:
		$VBoxContainer2/MarginContainer/Neighbours.pressed=false
		return
	$VBoxContainer2/FactBox.text=format_neighbours()

var cluecache={}
func cycleclues(f):
	if f in cluecache:
		cluecache[f]+=1 
		return cluecache[f] % facts[targets[0]].size()
	else:
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
		#print(idx, cluecache)
		$VBoxContainer2/FactBox.text=prefix+'Head to the district known for - \n'+strip_metadata(facts[targets[0]][idx])
	
func _on_history_pressed():
	if historytext==null or historytext=="":
		return
	$VBoxContainer2/FactBox.text=historytext

func _on_Neighbours_toggled(button_pressed):
	if n == null:
		$VBoxContainer2/MarginContainer/Neighbours.pressed=false
		return
	if len(n) == 0:
		$VBoxContainer2/MarginContainer/Neighbours.pressed=false
		return
	emit_signal('show_neighbours', button_pressed)
	
