extends PanelContainer
signal selected

func _ready():
	$MarginContainer/VBoxContainer/River.connect('pressed', self, 'on_quest_select',["river"])
	$MarginContainer/VBoxContainer/Sea.connect('pressed', self, 'on_quest_select',["sea"])

var q={river={
		text="The Kaveri river bisects Tamil Nadu into North and South, flowing from the Western Ghats to the Bay of Bengal through 9 Districts.",
		districts=["Dharmapuri", "Salem", "Erode", "Namakkal","Tiruchirapalli", 
		"Thanjavur", "Nagapattinam","Tiruvarur","Mayiladithurai"]},
		sea={text="The coast line of Tamil Nadu is 1076 km long covering 14 districts with 15 major ports",
		districts=["Tiruvallur","Chennai","Chengalpattu","Vilippuram",
		"Cuddalore","Mayiladithurai","Nagapattinam","Tiruvarur",
		"Thanjavur","Pudukotai","Ramanathapuram","Thoothukudi","Tirunelveli","Kanyakumari"]},
		mountains={text="The Western and Eastern Ghats ",districts=["Nilgiris", "Coimbatore", "Tiruppur", "Theni", "Erode","Dindigul","Tenkasi","Tirunelveli","Kanyakumari", "Vellore","Tiruvannamalai","Tirupattur"]},
	}

func on_quest_select(qname):
	if qname=="river":
		$PopupPanel/Label.text=q[qname].text
		$PopupPanel.popup()
		randomize()
		q[qname].districts.shuffle()		
		emit_signal('selected',q[qname].districts)
