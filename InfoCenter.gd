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
			"Athangudi Tiles",
			"Brihadeshwara temple",
			"Chettinad Cuisine",
			"Seat of the Chola Empire",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Madurai=[
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
		Sivagangai=[
			'Found here is the 2500 year old Keezhadi excavation site, including plates with the Tamil-Brahmi script'
		],
		Vilippuram=[
			"Gingee Fort is found here. Sivaji called it the most impregnable fortress in India"
		],
		Virudhunagar=[
			"K. Kamaraj was from here. He was TN CM from 54-63, and Indian National Congress President after Jawaharlal Nehru's death. He made education free for the poor having had to drop out of school at age 11 to support his family",
			'Sivakasi Fireworks'
		],
		Vellore=[
			"Top exporter of finished Leather goods in the country",
			"500 year old Vellore Fort is a popular tourist attraction. Was location of the 1806 Sepoy Mutiny against the British"
		],
		Thoothukudi=["Known in the past as the Pearl Fishery Coast", 
		"Veerapandiya Kattabomman","great poet Subramanya Bharathi",
		"V.O.Chidambaram Pillai Swadeshi Steamship Company"],
		Karur=["Capital of the Chera Kings"],
		Mayiladuthurai=[ 'Ancient Port town of Poombuhar where the Kaveri meets the sea '],
		Tiruppur=["Textile export hub"],
		Tirupathur=[],
		Tiruchirappali=['Rockfort Temple'],
		Pudukottai=[],
		Tenkasi=['Old Courtallam Falls'],
		Perambalur=[],
		Ariyalur=['prehistoric fossils','Gangaikondacholapuram'],
		Ranipet=['Ceramics'],
		Kallakurichi=[],
		Cuddalore=['Beaches'],
		Dindigul=['Famous Kodaikanal hill station'],
		Dharmapuri=["Hogenakkal"],
		Nagapattinum=['Velankanni festival', 'Was hit by the 2004 Tsunami 6000 lives lost', 'Danish Fort' ],
		Nilgiris=[
			'coffee, tea, rubber, eucalyptus plantaination',
			'Mudumalai Tiger Reserve is the largest in TN with 160 using the corridor and 103 resident ' ]
	}
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide()# Replace with function body.

func reload(district):
	$VBoxContainer/PanelContainer/imgbox.texture=load("res://"+district+".png")
	$VBoxContainer/NameBox.text=district
	if district in facts:
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
