extends GridContainer

#class DB:
var facts:={
		Chennai=["State Capital"],
		Chengalpattu=[
			"Named after the Sengazhuneer poo (Red White Lily) that grows in abundance along the river banks",
			"Mahaballipuram site of some of the earliest Rock Temples and Stone Sculpture that influenced the style of Temple Architecture throughout South India"],
		Kanyakumari=[
			"Southern most district of TN and the Indian main land",
			"Nagarcoil is the District HQ",
			"The only district of TN facing the Arabian Sea"],
		Salem=['Steal'],
		Theni=['Indian Neutrino Observatory',
		'Meghamalai Wildlife Sanctuary'],
		Kanchipuram=[
			"District HQ is Kanchipuram also known as the City of a Thousand Temples",
			"Capital of the Panllava Kingdom from the 4th to the 9th Century",
			"Headquarters of the Kanchi matha, founded by Adi Sankaracharya",
			"Famous for the hand woven Kanchipuram Silk Saree. Wedding saree being a speciality",
			"Ekambareswarar Temple covers 25 acres is one of the largest temple complexes in India. The Southern Gopuram is 11 stories tall making it one of the taller temple towers. Showcasing the architecture of the Vijayanagara dynasty",
			"Kailasanathar Temple and the Vaikunta Perumal Temple found here are nearly 1350 years old"
		],
		Tiruvarur=[
			'Thyagaraja Temple Chariot in Thiruvarur stands 96 feet tall',
			'Birthplace of Saint Thyagaraja, the composer of Carnatic music'	
		],
		Krishnagiri=[
			"Krishnagiri district is one of the largest producers of Mangoes in India"
		],
		Ramanathapuram=[
			"Birth place of President A.P.J Abdul Kalam",
			"Rameshwaram/Dhanushkodi"
		],
		Thanjavur=[
			"Brihadeshwara temple",
			"Seat of the Chola Empire",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Madurai=[
			'The Meenakshi Amman Temple is one of the largest temple complexes in the state with 14 Gopurams (Gateway Towers), 33000 scupltures, a thousand pillared hall, tank legend, parrots...',
			'Many areas well known for conducting the Jallikattu (bull taming) ceremony during the Pongal (harvest festival) season',
			'Jasmine (Madurai Malli)'
		],
		Tirunelveli=["Halwa"],
		Erode=[
			"Turmeric",
			"Agri powerhouse due to rivers and dams",
			"Sathyamangalam Tiger Reserve 83 tigers and 111 Leopards"
		],
		Coimbatore=[
			'Eastern end of the Palakkad Gap, the lowest pass through the Western Ghats linking Kerala and Tamil Nadu. Also called Kovai',
			'Coimbatore is called the Manchester of South India due to extensive textile industry, fed by the surrounding cotton fields'
		],
		Tiruvannamalai=[
			"Arunachala hill, deepam festival",
			"Arni silk production",
			"Largest Rice producers"
		],
		Namakkal=['Cauvery flows thro, Tiruchengode...','Known for its Poutry Farms and  Lorry body building industry', 'Namakkal derives from Namagiri, the name of the single 65m high rock formation at the center of the Namakkal town. A Fort covering one and half acres was built on top of the rock in the 17th century'],
		Sivagangai=['Chettinad formed by a prosperous banking and business community built from trading with Burma, Ceylon and Malaysia',
		'Athangudi tiles', 'Known for the famous Chettinad cuisine',
			'Found here is the 2500 year old Keezhadi excavation site, including plates with the Tamil-Brahmi script'
		],
		Vilippuram=["Pondicherry, Auroville ",
			"Gingee Fort is found here. Sivaji called it the most impregnable fortress in India"
		],
		Virudhunagar=[
			"K. Kamaraj was from here. He was TN CM from 54-63, and Indian National Congress President after Jawaharlal Nehru's death. He made education free for the poor having had to drop out of school at age 11 to support his family",
			'Sivakasi Fireworks',
			'The 192 ft Gopuram of the Srivilliputhur Temple built here, dedicated to Andal the only female among the poet saints of south india, is the symbol of the Tamil Nadu Govt'
		],
		Vellore=[
			"Top exporter of finished Leather goods in the country",
			"500 year old Vellore Fort is a popular tourist attraction. Was location of the 1806 Sepoy Mutiny against the British"
		],
		Thoothukudi=["Known in the past as the Pearl Fishery Coast", 
		"Veerapandiya Kattabomman","great poet Subramanya Bharathi",
		"V.O.Chidambaram Pillai Swadeshi Steamship Company"],
		Karur=["Capital of the Chera Kings"],
		Mayiladithurai=[ 'Ancient Port town of Poombuhar where the Kaveri meets the sea '],
		Tiruppur=["Textile export hub"],
		Tirupathur=['Surrounded by the Javadhu and Yelagiri Hills known for rivers, waterfalls and sandal wood trees', 'Ambur Biriyani'],
		Tiruchirapalli=['The Srirangam temple complex covers 156 acres making it the largest templex complex in the country. Famous for festivals conducted throughout the year', 
		'Rockfort Temple'],
		Pudukottai=['Was a independent princely state ruled by the Thondaimans since the 17th century'],
		Tenkasi=['Old Courtallam Falls', 'Thirukutralam'],
		Perumbalur=['Leads the state in Small Onion production'],
		Ariyalur=['prehistoric fossils','Gangaikondacholapuram'],
		Ranipet=['Ceramics'],
		Kallakurichi=['Mainly a rural area 50 years ago increased road connectivity has turned into an emerging agricultural hub.',
		'The Kalvarayan Hills are pristine unexplored area with the Vellimalai hilltop becoming a popular tourist spot for locals during the monsoon season.'],
		Cuddalore=['Koodalur means confluence in Tamil. It is the place where the Pennaiyar, Kedilam, Paravanar and Uppanaar rivers join',
		'Ports, Beaches, fishing villages','Was known as Naadu Nadu or the middle kingdom betweene Cholas in the South and the Pallavas in the North', 
		"Fort St David in Cuddalore was one of the main British trading posts controling their activities in South India in the early 1700. So Cuddalore became the site of multiple wars with the French based 25kms North in Pondicherry",
		"Silver Beach is one of the longest beaches found on the Coromandel Coast. 2700 people lost their life here during the 2004 Tsunami", 'Chidambaram temple','Pichawaram Mangrove forests'],
		Dindigul=['Famous Kodaikanal hill station'],
		Dharmapuri=["Hogenakkal"],
		Nagapattinam=['Velankanni festival', 'Was hit by the 2004 Tsunami 6000 lives lost', 'Danish Fort' ],
		Nilgiris=[
			'coffee, tea, rubber, eucalyptus plantaination',
			'Mudumalai Tiger Reserve is the largest in TN with 160 using the corridor and 103 resident ' ]
	}
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()# Replace with function body.
var n=[]
func reload(district, neighbours):
	n.clear()
	n=neighbours
	$VBoxContainer/PanelContainer/imgbox.texture=load("res://"+district+".png")
	$VBoxContainer/NameBox.text=district
	if district in facts and facts[district].size() > 0:
		var idx=int(rand_range(0, facts[district].size()))
		$VBoxContainer2/FactBox.text=facts[district][idx]
	else:
		$VBoxContainer2/FactBox.text=''
	show()

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
