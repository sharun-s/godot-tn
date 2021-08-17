extends GridContainer

#class DB:
var facts:={
		Kanyakumari=[
			"Southern most district of TN and the Indian main land",
			"Nagarcoil is the District HQ",
			"The only district of TN facing the Arabian Sea"
		],
		Kanchipuram=[
			"Capital of the Panllava Kingdom from the 4th to the 9th Century",
			"Headquarters of the Kanchi matha, founded by Adi Sankaracharya",
			"Famous for the hand woven Kanchipuram Silk Saree. Wedding saree being a speciality",
			"Ekambareswarar Temple covers 25 acres is one of the largest temple complexes in India. The Southern Gopuram is 11 stories tall making it one of the taller temple towers.",
			"Kailasanathar Temple and the Vaikunta Perumal Temple found here are nearly 1350 years old"
		],
		Tiruvarur=[
			'Thyagaraja Temple Chariot in Thiruvarur stands 96 feet tall' 
		],
		Virudhunagar=[
			'Sivakasi Fireworks'
		],
		Krishnagiri=[
			"Krishnagiri district is one of the largest producers of Mangoes in India"
		],
		Ramanathapuram=[
			"Birth place of President A.P.J Abdul Kalam"
		],
		Thanjavur=[
			"Chettinad Cuisine",
			"Seat of the Chola Empire",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Madurai=[
			'Jasmine (Madurai Malli)'
		],
		Tirunelveli=[
			"Halwa"
		],
		Erode=[
			"Turmeric",
		],
		Coimbatore=[
			'Eastern end of the Palakkad Gap, the lowest pass through the Western Ghats linking Kerala and Tamil Nadu',
			'Coimbatore is called the Manchester of South India due to extensive textile industry, fed by the surrounding cotton fields'
		]
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
