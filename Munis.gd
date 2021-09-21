extends Node2D

var munis=[{name="Alandur",x=13.003,y=80.204,kind="Municipality Selection grade",d="Chennai"},
{name="Ambasamudram",x=8.7,y=77.47,kind="Municipality Second grade",d="Tirunelveli"},
{name="Ambur",x=12.78,y=78.7,kind="Municipality Selection grade",d="Tirupathur"},
{name="Anakaputhur",x=12.9828,y=80.1264,kind="Municipality Second grade",d="Chennai"},
{name="Arakkonam",x=13.07777778,y=79.66666667,kind="Municipality First grade",d="Ranipet"},
{name="Arani",x=12.67,y=79.28,kind="Municipality First grade",d="Tiruvannamalai"},
{name="Aranthangi",x=10.1631,y=78.9962,kind="Municipality First grade",d="Pudukotai"},
{name="Arcot",x=12.99,y=79.314,kind="Municipality First grade",d="Ranipet"},
{name="Ariyalur",x=11.13722222,y=79.07777778,kind="Municipality Second grade",d="Ariyalur"},
{name="Aruppukkottai",x=9.51,y=78.1,kind="Municipality First grade",d="Virudhunagar"},
{name="Attur",x=11.599341,y=78.597752,kind="Municipality Selection grade",d="Salem"},
{name="Avadi",x=13.12,y=80.1,kind="Municipality Special grade",d="Tiruvallur"},
{name="Bhavani",x=11.45,y=77.68,kind="Municipality Second grade",d="Erode"},
{name="Bodinayakanur",x=10.02,y=77.35,kind="Municipality First grade",d="Theni"},
{name="Chengalpattu",x=12.68333333,y=79.98333333,kind="Municipality First grade",d="Chengalpattu"},
{name="Chennai",x=13.08333333,y=80.26666667,kind="Muni Corporation",d="Chennai"},
{name="Chidambaram",x=11.4,y=79.7,kind="Municipality Selection grade",d="Cuddalore"},
{name="Chinnamanur",x=9.83,y=77.38,kind="Municipality Second grade",d="Theni"},
{name="Coimbatore",x=11.01833333,y=76.9725,kind="Muni Corporation",d="Coimbatore"},
{name="Colachel",x=8.17,y=77.24,kind="Municipality First grade",d="Kanyakumari"},
{name="Coonoor",x=11.35,y=76.82,kind="Municipality Selection grade",d="Nilgiris"},
{name="Cuddalore",x=11.75,y=79.75,kind="Municipality Special grade",d="Cuddalore"},
{name="Cumbum",x=9.73,y=77.3,kind="Municipality First grade",d="Theni"},
{name="Devakottai",x=9.94194444,y=78.82666667,kind="Municipality First grade",d="Sivagangai"},
{name="Dharapuram",x=10.73,y=77.52,kind="Municipality First grade",d="Tiruppur"},
{name="Dharmapuri",x=12.126,y=78.154,kind="Municipality Selection grade",d="Dharmapuri"},
{name="Dindigul",x=10.35,y=77.95,kind="Muni Corporation",d="Dindigul"},
{name="Edappadi",x=11.58,y=77.85,kind="Municipality First grade",d="Salem"},
{name="Erode",x=11.35,y=77.73333333,kind="Muni Corporation",d="Erode"},
{name="Gobichettipalayam",x=11.45361111,y=77.43833333,kind="Municipality Selection grade",d="Erode"},
{name="Gudalur (Nilgiris district)",x=11.50,y=76.50,kind="Municipality Second grade",d="Nilgiris"},
{name="Gudalur (Theni district)",x=9.68,y=77.27,kind="Municipality Second grade",d="Theni"},
{name="Gudiyatham",x=12.93972,y=78.8644,kind="Municipality First grade",d="Vellore"},
{name="Hosur",x=12.735,y=77.829,kind="Municipality Special grade",d="Krishnagiri"},
{name="Jayankondam",x=11.212,y=79.365,kind="Municipality Second grade",d="Ariyalur"},
{name="Jolarpettai",x=12.56,y=78.58,kind="Municipality Second grade",d="Tirupathur"},
{name="Kadayanallur",x=9.08,y=77.35,kind="Municipality First grade",d="Tirunelveli"},
{name="Kallakurichi",x=11.738,y=78.962,kind="Municipality First grade",d="Kallakurichi"},
{name="Kanchipuram",x=12.82,y=79.71,kind="Municipality Special grade",d="Kanchipuram"},
{name="Kangeyam",x=11.0054,y=77.562,kind="Municipality Second grade",d="Tiruppur"},
{name="Karaikudi",x=10.07,y=78.78,kind="Municipality Special grade",d="Sivagangai"},
{name="Karur",x=10.95,y=78.08,kind="Municipality Special grade",d="Karur"},
{name="Kayalpattinam",x=8.57,y=78.12,kind="Municipality Second grade",d="Thoothukudi"},
{name="Keelakarai",x=9.23135,y=78.7844,kind="Municipality Second grade",d="Ramanathapuram"},
{name="Kodaikanal",x=10.23,y=77.48,kind="Municipality Special grade",d="Dindigul"},
{name="Komarapalayam",x=11.4433333,y=77.7113889,kind="Municipality First grade",d="Namakkal"},
{name="Koothanallur",x=10.71666667,y=79.51666667,kind="Municipality Second grade",d="Thiruvarur"},
{name="Kovilpatti",x=9.17,y=77.87,kind="Municipality Special grade",d="Thoothukudi"},
{name="Krishnagiri",x=12.53,y=78.23,kind="Municipality First grade",d="Krishnagiri"},
{name="Kulithalai",x=10.56,y=78.25,kind="Municipality Second grade",d="Karur"},
{name="Kumbakonam",x=10.97,y=79.42,kind="Municipality Special grade",d="Thanjavur"},
{name="Kuzhithurai",x=8.31666667,y=77.18333333,kind="Municipality Second grade",d="Kanyakumari"},
{name="Madurai",x=9.9,y=78.1,kind="Muni Corporation",d="Madurai"},
{name="Maduranthakam",x=12.5101,y=79.8849,kind="Municipality Second grade",d="Kanchipuram"},
{name="Manapparai",x=10.60759,y=78.414874,kind="Municipality First grade",d="Tiruchirappalli"},
{name="Mannargudi",x=10.663,y=79.445,kind="Municipality Selection grade",d="Tiruvarur"},
{name="Maraimalainagar",x=12.785185,y=80.025601,kind="Municipality Special grade",d="Kanchipuram"},
{name="Mayiladithurai",x=11.1,y=79.65,kind="Municipality Selection grade",d="Mayiladithurai"},
{name="Melur",x=10.05,y=78.33,kind="Municipality Second grade",d="Madurai"},
{name="Melvisharam",x=12.9333,y=79.2833,kind="Municipality Second grade",d="Ranipet"},
{name="Mettupalayam",x=11.3,y=76.95,kind="Municipality Selection grade",d="Coimbatore"},
{name="Mettur",x=11.8,y=77.8,kind="Municipality Selection grade",d="Salem"},
{name="Nagapattinam",x=10.77,y=79.83,kind="Municipality Selection grade",d="Nagapattinam"},
{name="Nagercoil",x=8.17,y=77.43,kind="Municipality Special grade",d="Kanyakumari"},
{name="Namakkal",x=11.23333333,y=78.16666667,kind="Municipality Selection grade",d="Namakkal"},
{name="Nellikuppam",x=11.7667,y=79.6833,kind="Municipality Second grade",d="Cuddalore"},
{name="Nelliyalam",x=11.49722222,y=76.37583333,kind="Municipality Second grade",d="Nilgiris"},
{name="Oddanchatram",x=10.48,y=77.75,kind="Municipality Second grade",d="Dindigul"},
{name="Padmanabhapuram",x=8.23,y=77.33,kind="Municipality Second grade",d="Kanyakumari"},
{name="Palani",x=10.45,y=77.52,kind="Municipality Selection grade",d="Dindigul"},
{name="Palladam",x=10.98,y=77.3,kind="Municipality First grade",d="Tiruppur"},
{name="Pallavapuram",x=12.98,y=80.18,kind="Municipality Special grade",d="Chennai"},
{name="Pallipalayam",x=11.364616,y=77.747921,kind="Municipality Second grade",d="Namakkal"},
{name="Pammal",x=12.975,y=80.134722,kind="Municipality Selection grade",d="Kanchipuram"},
{name="Panruti",x=11.77,y=79.55,kind="Municipality First grade",d="Cuddalore"},
{name="Paramakudi",x=9.544,y=78.591,kind="Municipality First grade",d="Ramanathapuram"},
{name="Pattukkottai",x=10.43,y=79.32,kind="Municipality Selection grade",d="Thanjavur"},
{name="Perumbalur",x=11.23,y=78.88,kind="Municipality Second grade",d="Perumbalur"},
{name="Periyakulam",x=10.12,y=77.55,kind="Municipality Second grade",d="Theni"},
{name="Pernampattu",x=12.939,y=78.73,kind="Municipality Second grade",d="Vellore"},
{name="Pollachi",x=10.659,y=77.008,kind="Municipality Special grade",d="Coimbatore"},
{name="Poonamallee",x=13.05,y=80.11,kind="Municipality First grade",d="Tiruvallur"},
{name="Pudukotai",x=10.38,y=78.82,kind="Municipality Selection grade",d="Pudukotai"},
{name="Puliyankudi",x=9.1,y=77.23,kind="Municipality Second grade",d="Tirunelveli"},
{name="Punjai Puliampatti",x=11.35,y=77.168,kind="Municipality Second grade",d="Erode"},
{name="Rajapalayam",x=9.45,y=77.55,kind="Municipality Special grade",d="Virudhunagar"},
{name="Ramanathapuram",x=9.367,y=78.835,kind="Municipality First grade",d="Ramanathapuram"},
{name="Rameswaram",x=9.288,y=79.313,kind="Municipality Second grade",d="Ramanathapuram"},
{name="Ranipet",x=12.9275,y=79.3302,kind="Municipality Selection grade",d="Ranipet"},
{name="Rasipuram",x=11.47,y=78.17,kind="Municipality First grade",d="Namakkal"},
{name="Salem",x=11.65,y=78.16,kind="Muni Corporation",d="Salem"},
{name="Sankarankoil",x=9.16,y=77.55,kind="Municipality First grade",d="Tirunelveli"},
{name="Sathyamangalam",x=11.5167,y=77.25,kind="Municipality First grade",d="Erode"},
{name="Sattur",x=9.37,y=77.93,kind="Municipality Second grade",d="Virudhunagar"},
{name="Sembakkam",x=12.92638889,y=80.165,kind="Municipality First grade",d="Chennai"},
{name="Sengottai",x=8.973333,y=77.246389,kind="Municipality Second grade",d="Tirunelveli"},
{name="Sirkazhi",x=11.239,y=79.736,kind="Municipality Second grade",d="Mayiladuthurai"},
{name="Sivagangai",x=9.87,y=78.48,kind="Municipality First grade",d="Sivagangai"},
{name="Sivakasi",x=9.45,y=77.82,kind="Municipality Special grade",d="Virudhunagar"},
{name="Srivilliputhur",x=9.512,y=77.633,kind="Municipality First grade",d="Virudhunagar"},
{name="Tambaram",x=12.93,y=80.11,kind="Municipality Special grade",d="Chennai"},
{name="Tenkasi",x=8.97,y=77.3,kind="Municipality First grade",d="Tenkasi"},
{name="Thanjavur",x=10.78333333,y=79.13611111,kind="Muni Corporation",d="Thanjavur"},
{name="Theni Allinagaram",x=10.009,y=77.2843,kind="Municipality Selection grade",d="Theni"},
{name="Thiruthangal",x=9.47583333,y=77.7925,kind="Municipality First grade",d="Virudhunagar"},
{name="Thiruthani",x=13.18,y=79.63,kind="Municipality Second grade",d="Tiruvallur"},
{name="Thiruthuraipoondi",x=10.53,y=79.65,kind="Municipality Second grade",d="Thiruvarur"},
{name="Thiruvannamalai",x=12.22,y=79.07,kind="Municipality Special grade",d="Tiruvannamalai"},
{name="Thiruvathipuram",x=12.6580,y=79.5424,kind="Municipality Second grade",d="Tiruvannamalai"},
{name="Thiruverkadu",x=13.069529,y=80.12423,kind="Municipality Selection grade",d="Tiruvallur"},
{name="Thoothukudi",x=8.81,y=78.14,kind="Muni Corporation",d="Thoothukudi"},
{name="Thuraiyur",x=11.16861111,y=78.62111111,kind="Municipality Selection grade",d="Tiruchirappalli"},
{name="Thuvakudi",x=10.75638889,y=78.80111111,kind="Municipality Second grade",d="Tiruchirappalli"},
{name="Tindivanam",x=12.237,y=79.65,kind="Municipality Selection grade",d="Vilippuram"},
{name="Tiruchengode",x=11.3805,y=77.895125,kind="Municipality Selection grade",d="Namakkal"},
{name="Tiruchirappalli",x=10.805,y=78.68555556,kind="Muni Corporation",d="Tiruchirapalli"},
{name="Tirumangalam",x=9.81,y=77.98,kind="Municipality Second grade",d="Madurai"},
{name="Tirunelveli",x=8.73,y=77.7,kind="Muni Corporation",d="Tirunelveli"},
{name="Tirupathur",x=12.50,y=78.60,kind="Municipality Selection grade",d="Tirupathur"},
{name="Tiruppur",x=11.11,y=77.34,kind="Muni Corporation",d="Tiruppur"},
{name="Tiruvallur",x=13.15,y=79.91,kind="Municipality First grade",d="Tiruvallur"},
{name="Tiruvarur",x=10.773,y=79.637,kind="Municipality First grade",d="Thiruvarur"},
{name="Udhagamandalam",x=11.41,y=76.70,kind="Municipality Special grade",d="Nilgiris"},
{name="Udumalaipettai",x=10.58,y=77.24,kind="Municipality Selection grade",d="Tiruppur"},
{name="Usilampatti",x=9.97,y=77.8,kind="Municipality Second grade",d="Madurai"},
{name="Valparai",x=10.37,y=76.97,kind="Municipality Selection grade",d="Coimbatore"},
{name="Vandavasi",x=12.5,y=79.62,kind="Municipality Second grade",d="Tiruvannamalai"},
{name="Vaniyambadi",x=12.68,y=78.62,kind="Municipality Selection grade",d="Tirupathur"},
{name="Vedaranyam",x=10.37527778,y=79.85027778,kind="Municipality Second grade",d="Nagapattinam"},
{name="Vellakoil",x=10.93,y=77.72,kind="Municipality Second grade",d="Tiruppur"},
{name="Vellore",x=12.920219,y=79.133306,kind="Muni Corporation",d="Vellore"},
{name="Vikramasingapuram",x=8.67,y=77.33,kind="Municipality Second grade",d="Tirunelveli"},
{name="Vilippuram",x=11.941,y=79.493,kind="Municipality Selection grade",d="Vilippuram"},
{name="Virudhachalam",x=11.5,y=79.33,kind="Municipality First grade",d="Cuddalore"},
{name="Virudhunagar",x=9.58333333,y=77.95,kind="Municipality Selection grade",d="Virudhunagar"},
{name="Walajapet",x=13,y=79.314,kind="Municipality Second grade",d="Vellore"}]

var minlat=8.17 
var minlng=76.375833
var maxlat=13.18 
var maxlng= 80.266667
var radius = 6371 #earth

# Calculate global X and Y for top-left reference point        
var p0 = {scrX=0, scrY=0, lat=maxlat, lng=minlng}
# Calculate global X and Y for bottom-right reference point
var p1 = {scrX=1400, scrY=1900, lat=minlat, lng=maxlng}

# This function converts lat and lng coordinates to GLOBAL X and Y positions
func latlngToGlobalXY(lat, lng):
	# Calculates x based on cos of average of the latitudes
	var x = radius*lng*cos((p0.lat + p1.lat)/2)
	# Calculates y based on latitude
	var y = radius*lat
	#print(x,' ',y)
	return Vector2(x, y)

# This function converts lat and lng coordinates to SCREEN X and Y positions
func latlngToScreenXY(lat, lng):
	# Calculate global X and Y for projection point
	var pos = latlngToGlobalXY(lat, lng)
	var p0pos=latlngToGlobalXY(p0.lat, p0.lng)
	var p1pos=latlngToGlobalXY(p1.lat, p1.lng)
	# Calculate the percentage of Global X position in relation to total global width
	var perX = ((pos.x-p0pos.x)/(p1pos.x - p0pos.x))
	# Calculate the percentage of Global Y position in relation to total global height
	var perY = ((pos.y-p0pos.y)/(p1pos.y - p0pos.y))
	# Returns the screen position based on reference points
	var l=Vector2(p0.scrX + (p1.scrX - p0.scrX)*perX, p0.scrY + (p1.scrY - p0.scrY)*perY)
	#print(l)
	return l

var df
func init_label_font():
	var f=load("res://DroidSans.ttf")
	df=DynamicFont.new()
	df.font_data=f
	df.size=40

var locationcache={}
var stats={}
func _ready():
	init_label_font()
	for i in munis:
		if i.d in stats:
			if i.kind in stats[i.d]:
				stats[i.d][i.kind]+=1
			else:
				stats[i.d][i.kind]=1
		else:
			stats[i.d]={}
			stats[i.d][i.kind]=1
		locationcache[i.name]=latlngToScreenXY(i.x, i.y)


var mtype=''
var district=''

func _draw():
	if district=='':
		return
	if district == 'all':
		for i in munis:
			if i.kind==mtype:
				var p=locationcache[i.name] #latlngToScreenXY(i.x, i.y)
				draw_string(df, p+Vector2(15, 0), i.name, 'f92672')		
				draw_circle(p, 6, 'ff2207')		
	else:
		for i in munis:
			#print(i.name, ' ', i.x,' ', i.y)
			if i.kind==mtype and i.d == district:
				var p=locationcache[i.name] #latlngToScreenXY(i.x, i.y)
				draw_string(df, p+Vector2(15, 0), i.name, 'f92672')		
				draw_circle(p, 6, 'ff2207')


func _on_InfoBox_muni_pressed(d, munitype):
	if d !='' and munitype!='':
		show()
		mtype=munitype
		district=d
		update()
	else:
		mtype=''
		district=''
		hide()	
