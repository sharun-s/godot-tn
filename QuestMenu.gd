extends PanelContainer
signal selected

func _ready():
	$MarginContainer/VBoxContainer/River.connect('pressed', self, 'on_quest_select',["river"])
	$MarginContainer/VBoxContainer/Sea.connect('pressed', self, 'on_quest_select',["sea"])
	$MarginContainer/VBoxContainer/Mountain.connect('pressed', self, 'on_quest_select',["mountains"])
	#$MarginContainer/VBoxContainer/Food.connect('pressed', self, 'on_quest_select',["food"])
	#$MarginContainer/VBoxContainer/People.connect('pressed', self, 'on_quest_select',["people"])
	#$MarginContainer/VBoxContainer/Culture.connect('pressed', self, 'on_quest_select',["culture"])

var q={river={
		text="The Kaveri river bisects Tamil Nadu into North and South, flowing from the Western Ghats to the Bay of Bengal through 9 Districts.",
		districts=["Dharmapuri", "Salem", "Erode", "Namakkal","Tiruchirapalli", 
		"Thanjavur", "Nagapattinam","Tiruvarur","Mayiladithurai"]},
		sea={text="The coast line of Tamil Nadu is 1076 km long covering 14 districts with 15 major ports",
		districts=["Tiruvallur","Chennai","Chengalpattu","Vilippuram",
		"Cuddalore","Mayiladithurai","Nagapattinam","Tiruvarur",
		"Thanjavur","Pudukotai","Ramanathapuram","Thoothukudi","Tirunelveli","Kanyakumari"]},
		mountains={text="The Western Ghats run along 9 districts on the Kerala Border. While the Eastern Ghats are found in 3 northern districts.",districts=[
			"Nilgiris", "Coimbatore", "Tiruppur", "Theni", 
		"Erode","Dindigul","Tenkasi","Tirunelveli",
		"Kanyakumari", "Vellore","Tiruvannamalai","Tirupathur"]},
	}

func on_quest_select(qname):
	$PopupPanel/Label.text=str(qname).to_upper()+"\n"+q[qname].text+"\n\n You will be tested on these districts. Good Luck!"
	$PopupPanel.popup_centered()
	randomize()
	q[qname].districts.shuffle()		
	emit_signal('selected',q[qname].districts)
