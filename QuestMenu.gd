extends PanelContainer
signal selected
var chk=preload("res://Check.svg")

func _ready():
	$MarginContainer/VBoxContainer/River.connect('pressed', self, 'on_quest_select',["river"])
	$MarginContainer/VBoxContainer/Sea.connect('pressed', self, 'on_quest_select',["sea"])
	$MarginContainer/VBoxContainer/Mountains.connect('pressed', self, 'on_quest_select',["mountains"])
	$MarginContainer/VBoxContainer/Food.connect('pressed', self, 'on_quest_select',["food"])
	$MarginContainer/VBoxContainer/People.connect('pressed', self, 'on_quest_select',["people"])
	$MarginContainer/VBoxContainer/Culture.connect('pressed', self, 'on_quest_select',["culture"])
	$MarginContainer/VBoxContainer/Movies.connect('pressed', self, 'on_quest_select',["movies"])
	$MarginContainer/VBoxContainer/istory.connect('pressed', self, 'on_quest_select',["history"])

var q={
	river={
		text="The Kaveri river bisects Tamil Nadu into North and South, flowing from the Western Ghats to the Bay of Bengal through 9 Districts.",
		districts=["Dharmapuri", "Salem", "Erode", "Namakkal","Tiruchirapalli", 
		"Thanjavur", "Nagapattinam","Tiruvarur","Mayiladithurai"],
		done=false
		},
	sea={
		text="The coast line of Tamil Nadu is 1076 km long covering 14 districts with 15 major ports",
		districts=["Tiruvallur","Chennai","Chengalpattu","Vilippuram",
		"Cuddalore","Mayiladithurai","Nagapattinam","Tiruvarur",
		"Thanjavur","Pudukotai","Ramanathapuram","Thoothukudi","Tirunelveli","Kanyakumari"],
		done=false
		},
	mountains={text="The Western Ghats run along 9 districts on the Kerala Border. While the Eastern Ghats are found in 3 northern districts.",districts=[
			"Nilgiris", "Coimbatore", "Tiruppur", "Theni", 
		"Erode","Dindigul","Tenkasi","Tirunelveli",
		"Kanyakumari", "Vellore","Tiruvannamalai","Tirupathur"],
		done=false
		},
	food={text='',districts=[],done=false},
	people={text='',districts=[],done=false},
	culture={text='',districts=[],done=false},
	movies={text='',districts=[],done=false},
	history={text='',districts=[],done=false}
	}
var current=''
func on_quest_select(qname):
	current=qname
	$PopupPanel/Label.text=str(qname).to_upper()+"\n"+q[qname].text+"\n\n You will be tested on these districts. Solve 5 clues to unlock next quest. Good Luck!"
	$PopupPanel.popup_centered()
	randomize()
	q[qname].districts.shuffle()		
	emit_signal('selected',q[qname].districts, qname)

func _quest_over(turnstaken, cluessolved, success):
	if current == '':
		#its not a multiquest no need to handle
		return
	if success:
		q[current].done=true
		var btn:Button=$MarginContainer/VBoxContainer.get_node_or_null(current.capitalize())
		btn.icon=chk
		var idx:=0
		for i in $MarginContainer/VBoxContainer.get_children():
			if i == btn:
				break
			idx=idx+1
		var nextbtn:Button=$MarginContainer/VBoxContainer.get_child(idx+1)
		nextbtn.disabled=false
	#btn.disabled=true
	current=''

func _on_subject_quests_ready(data):
	for i in data:
		if i=='f':
			q['food'].districts=data[i].keys()
		elif i=='p':
			q['people'].districts=data[i].keys()
		elif i=='h':
			q['history'].districts=data[i].keys()
		elif i=='t':
			q['culture'].districts=data[i].keys()
		elif i=='m':
			q['movies'].districts=data[i].keys()
		else:
			continue
