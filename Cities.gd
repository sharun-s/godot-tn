extends Node2D

var Cities=[
{name="Alandur",position = Vector2( 577.42, 81.6037 ),group = "Municipality Selection grade",district = "Chennai",radius = 5},
{name="Ambasamudram",position = Vector2( 179.882, 709.175 ),group = "Municipality Second grade",district = "Tirunelveli",radius = 4},
{name="Ambur",position = Vector2( 358.731, 114.127 ),group = "Municipality Selection grade",district = "Tirupathur",radius = 5},
{name="Anakaputhur",position = Vector2( 563.136, 80.5498 ),group = "Municipality Second grade",district = "Chengalpattu",radius = 4},
{name="Arakkonam",position = Vector2( 499.289, 70.6978 ),group = "Municipality First grade",district = "Ranipet",radius = 5},
{name="Arani",position = Vector2( 443.066, 130.17 ),group = "Municipality First grade",district = "Tiruvannamalai",radius = 5},
{name="Aranthangi",position = Vector2( 401.8, 495.789 ),group = "Municipality First grade",district = "Pudukotai",radius = 5},
{name="Arcot",position = Vector2( 448.009, 83.4997 ),group = "Municipality First grade",district = "Ranipet",radius = 5},
{name="Ariyalur",position = Vector2( 413.661, 353.718 ),group = "Municipality Second grade",district = "Ariyalur",radius = 4},
{name="Aruppukkottai",position = Vector2( 271.488, 591.04 ),group = "Municipality First grade",district = "Virudhunagar",radius = 5},
{name="Attur",position = Vector2( 343.863, 286.32 ),group = "Municipality Selection grade",district = "Salem",radius = 5},
{name="Avadi",position = Vector2( 562.298, 64.5399 ),group = "Municipality Special grade",district = "Tiruvallur",radius = 5},
{name="Bhavani",position = Vector2( 210.418, 308.101 ),group = "Municipality Second grade",district = "Erode",radius = 4},
{name="Bodinayakanur",position = Vector2( 162.434, 516.659 ),group = "Municipality First grade",district = "Theni",radius = 5},
{name="Chengalpattu",position = Vector2( 545.334, 128.226 ),group = "Municipality First grade",district = "Chengalpattu",radius = 5},
{name="Chennai",position = Vector2( 586.532, 69.8875 ),group = "Muni Corporation",district = "Chennai",radius = 7},
{name="Chidambaram",position = Vector2( 504.136, 315.393 ),group = "Municipality Selection grade",district = "Cuddalore",radius = 5},
{name="Chinnamanur",position = Vector2( 166.796, 544.37 ),group = "Municipality Second grade",district = "Theni",radius = 4},
{name="Coimbatore",position = Vector2( 107.544, 371.057 ),group = "Muni Corporation",district = "Coimbatore",radius = 7},
{name="Colachel",position = Vector2( 146.439, 786.473 ),group = "Municipality First grade",district = "Kanyakumari",radius = 5},
{name="Coonoor",position = Vector2( 85.3693, 322.685 ),group = "Municipality Selection grade",district = "Nilgiris",radius = 5},
{name="Cuddalore",position = Vector2( 511.406, 264.348 ),group = "Municipality Special grade",district = "Cuddalore",radius = 5},
{name="Cumbum",position = Vector2( 155.164, 558.954 ),group = "Municipality First grade",district = "Theni",radius = 5},
{name="Devakottai",position = Vector2( 377.149, 528.043 ),group = "Municipality First grade",district = "Sivagangai",radius = 5},
{name="Dharapuram",position = Vector2( 187.153, 413.109 ),group = "Municipality First grade",district = "Tiruppur",radius = 5},
{name="Dharmapuri",position = Vector2( 279.34, 209.51 ),group = "Municipality Selection grade",district = "Dharmapuri",radius = 5},
{name="Dindigul",position = Vector2( 249.677, 468.53 ),group = "Muni Corporation",district = "Dindigul",radius = 7},
{name="Edappadi",position = Vector2( 235.136, 289.141 ),group = "Municipality First grade",district = "Salem",radius = 5},
{name="Erode",position = Vector2( 218.172, 322.685 ),group = "Muni Corporation",district = "Erode",radius = 7},
{name="Gobichettipalayam",position = Vector2( 175.278, 307.574 ),group = "Municipality Selection grade",district = "Erode",radius = 5},
{name="Gudalur Nilgiris",position = Vector2( 38.8397, 300.809 ),group = "Municipality Second grade",district = "Nilgiris",radius = 4},
{name="Gudalur Theni",position = Vector2( 150.801, 566.247 ),group = "Municipality Second grade",district = "Theni",radius = 4},
{name="Gudiyatham",position = Vector2( 382.635, 90.8328 ),group = "Municipality First grade",district = "Vellore",radius = 5},
{name="Hosur",position = Vector2( 232.083, 120.69 ),group = "Municipality Special grade",district = "Krishnagiri",radius = 5},
{name="Jayankondam",position = Vector2( 455.425, 342.812 ),group = "Municipality Second grade",district = "Ariyalur",radius = 4},
{name="Jolarpettai",position = Vector2( 341.282, 146.213 ),group = "Municipality Second grade",district = "Tirupathur",radius = 4},
{name="Kadayanallur",position = Vector2( 162.434, 653.754 ),group = "Municipality First grade",district = "Tenkasi",radius = 5},
{name="Kallakurichi",position = Vector2( 396.827, 266.098 ),group = "Municipality First grade",district = "Kallakurichi",radius = 5},
{name="Kanchipuram",position = Vector2( 505.59, 108.293 ),group = "Municipality Special grade",district = "Kanchipuram",radius = 5},
{name="Kangeyam",position = Vector2( 193.26, 372.944 ),group = "Municipality Second grade",district = "Tiruppur",radius = 4},
{name="Karaikudi",position = Vector2( 370.363, 509.367 ),group = "Municipality Special grade",district = "Sivagangai",radius = 5},
{name="Karur",position = Vector2( 268.58, 381.023 ),group = "Municipality Special grade",district = "Karur",radius = 5},
{name="Kayalpattinam",position = Vector2( 274.396, 728.135 ),group = "Municipality Second grade",district = "Thoothukudi",radius = 4},
{name="Keelakarai",position = Vector2( 371.003, 631.68 ),group = "Municipality Second grade",district = "Ramanathapuram",radius = 4},
{name="Kodaikanal",position = Vector2( 181.337, 486.032 ),group = "Municipality Special grade",district = "Dindigul",radius = 5},
{name="Komarapalayam",position = Vector2( 214.982, 309.073 ),group = "Municipality First grade",district = "Namakkal",radius = 5},
{name="Koothanallur",position = Vector2( 477.478, 415.054 ),group = "Municipality Second grade",district = "Tiruvarur",radius = 4},
{name="Kovilpatti",position = Vector2( 238.044, 640.628 ),group = "Municipality Special grade",district = "Thoothukudi",radius = 5},
{name="Krishnagiri",position = Vector2( 290.39, 150.588 ),group = "Municipality First grade",district = "Krishnagiri",radius = 5},
{name="Kulithalai",position = Vector2( 293.298, 437.903 ),group = "Municipality Second grade",district = "Karur",radius = 4},
{name="Kumbakonam",position = Vector2( 463.422, 378.107 ),group = "Municipality Special grade",district = "Thanjavur",radius = 5},
{name="Kuzhithurai",position = Vector2( 138.2, 765.082 ),group = "Municipality Second grade",district = "Kanyakumari",radius = 4},
{name="Madurai",position = Vector2( 271.488, 534.161 ),group = "Muni Corporation",district = "Madurai",radius = 7},
{name="Maduranthakam",position = Vector2( 531.021, 153.491 ),group = "Municipality Second grade",district = "Chengalpattu",radius = 4},
{name="Manapparai",position = Vector2( 317.272, 430.962 ),group = "Municipality First grade",district = "Tiruchirappalli",radius = 5},
{name="Mannargudi",position = Vector2( 467.057, 422.881 ),group = "Municipality Selection grade",district = "Tiruvarur",radius = 5},
{name="Maraimalainagar",position = Vector2( 551.48, 113.371 ),group = "Municipality Special grade",district = "Chengalpattu",radius = 5},
{name="Mayiladithurai",position = Vector2( 496.865, 359.147 ),group = "Municipality Selection grade",district = "Mayiladithurai",radius = 5},
{name="Melur",position = Vector2( 304.931, 512.284 ),group = "Municipality Second grade",district = "Madurai",radius = 4},
{name="Melvisharam",position = Vector2( 443.545, 91.7691 ),group = "Municipality Second grade",district = "Ranipet",radius = 4},
{name="Mettupalayam",position = Vector2( 104.272, 329.978 ),group = "Municipality Selection grade",district = "Coimbatore",radius = 5},
{name="Mettur",position = Vector2( 227.866, 257.055 ),group = "Municipality Selection grade",district = "Salem",radius = 5},
{name="Nagapattinam",position = Vector2( 523.038, 407.276 ),group = "Municipality Selection grade",district = "Nagapattinam",radius = 5},
{name="Nagercoil",position = Vector2( 174.066, 786.473 ),group = "Municipality Special grade",district = "Kanyakumari",radius = 5},
{name="Namakkal",position = Vector2( 281.181, 339.701 ),group = "Municipality Selection grade",district = "Namakkal",radius = 5},
{name="Nellikuppam",position = Vector2( 501.707, 261.912 ),group = "Municipality Second grade",district = "Cuddalore",radius = 4},
{name="Nelliyalam",position = Vector2( 20.7852, 301.214 ),group = "Municipality Second grade",district = "Nilgiris",radius = 4},
{name="Oddanchatram",position = Vector2( 220.596, 449.571 ),group = "Municipality Second grade",district = "Dindigul",radius = 4},
{name="Padmanabhapuram",position = Vector2( 159.526, 777.722 ),group = "Municipality Second grade",district = "Kanyakumari",radius = 4},
{name="Palani",position = Vector2( 187.153, 453.946 ),group = "Municipality Selection grade",district = "Dindigul",radius = 5},
{name="Palladam",position = Vector2( 155.164, 376.648 ),group = "Municipality First grade",district = "Tiruppur",radius = 5},
{name="Pallavapuram",position = Vector2( 573.93, 84.9582 ),group = "Municipality Special grade",district = "Chennai",radius = 5},
{name="Pallipalayam",position = Vector2( 220.294, 320.554 ),group = "Municipality Second grade",district = "Namakkal",radius = 4},
{name="Pammal",position = Vector2( 567.346, 85.6874 ),group = "Municipality Selection grade",district = "Chengalpattu",radius = 5},
{name="Panruti",position = Vector2( 482.325, 261.431 ),group = "Municipality First grade",district = "Cuddalore",radius = 5},
{name="Paramakudi",position = Vector2( 342.882, 586.082 ),group = "Municipality First grade",district = "Ramanathapuram",radius = 5},
{name="Pattukkottai",position = Vector2( 448.882, 456.863 ),group = "Municipality Selection grade",district = "Thanjavur",radius = 5},
{name="Perumbalur",position = Vector2( 384.904, 340.187 ),group = "Municipality Second grade",district = "Perumbalur",radius = 4},
{name="Periyakulam",position = Vector2( 191.515, 502.075 ),group = "Municipality Second grade",district = "Theni",radius = 4},
{name="Pernampattu",position = Vector2( 363.093, 90.9378 ),group = "Municipality Second grade",district = "Vellore",radius = 4},
{name="Pollachi",position = Vector2( 112.705, 423.464 ),group = "Municipality Special grade",district = "Coimbatore",radius = 5},
{name="Poonamallee",position = Vector2( 563.752, 76.749 ),group = "Municipality First grade",district = "Tiruvallur",radius = 5},
{name="Pudukotai",position = Vector2( 376.179, 464.155 ),group = "Municipality Selection grade",district = "Pudukotai",radius = 5},
{name="Puliyankudi",position = Vector2( 144.985, 650.837 ),group = "Municipality Second grade",district = "Tenkasi",radius = 4},
{name="Punjai Puliampatti",position = Vector2( 135.97, 322.685 ),group = "Municipality Second grade",district = "Erode",radius = 4},
{name="Rajapalayam",position = Vector2( 191.515, 599.791 ),group = "Municipality Special grade",district = "Virudhunagar",radius = 5},
{name="Ramanathapuram",position = Vector2( 378.36, 611.896 ),group = "Municipality First grade",district = "Ramanathapuram",radius = 5},
{name="Rameswaram",position = Vector2( 447.864, 623.418 ),group = "Municipality Second grade",district = "Ramanathapuram",radius = 4},
{name="Ranipet",position = Vector2( 450.365, 94.615 ),group = "Municipality Selection grade",district = "Ranipet",radius = 5},
{name="Rasipuram",position = Vector2( 281.666, 305.184 ),group = "Municipality First grade",district = "Namakkal",radius = 5},
{name="Salem",position = Vector2( 280.212, 278.932 ),group = "Muni Corporation",district = "Salem",radius = 7},
{name="Sankarankoil",position = Vector2( 191.515, 642.086 ),group = "Municipality First grade",district = "Tenkasi",radius = 5},
{name="Sathyamangalam",position = Vector2( 147.893, 298.373 ),group = "Municipality First grade",district = "Erode",radius = 5},
{name="Sattur",position = Vector2( 246.769, 611.459 ),group = "Municipality Second grade",district = "Virudhunagar",radius = 4},
{name="Sembakkam",position = Vector2( 571.749, 94.7771 ),group = "Municipality First grade",district = "Chengalpattu",radius = 5},
{name="Sengottai",position = Vector2( 147.368, 669.31 ),group = "Municipality Second grade",district = "Tenkasi",radius = 4},
{name="Sirkazhi",position = Vector2( 509.37, 338.874 ),group = "Municipality Second grade",district = "Mayiladithurai",radius = 4},
{name="Sivagangai",position = Vector2( 326.742, 538.536 ),group = "Municipality First grade",district = "Sivagangai",radius = 5},
{name="Sivakasi",position = Vector2( 230.774, 599.791 ),group = "Municipality Special grade",district = "Virudhunagar",radius = 5},
{name="Srivilliputhur",position = Vector2( 203.584, 590.749 ),group = "Municipality First grade",district = "Virudhunagar",radius = 5},
{name="Tambaram",position = Vector2( 563.752, 92.2504 ),group = "Municipality Special grade",district = "Chengalpattu",radius = 5},
{name="Tenkasi",position = Vector2( 155.164, 671.797 ),group = "Municipality First grade",district = "Tenkasi",radius = 5},
{name="Thanjavur",position = Vector2( 422.143, 405.331 ),group = "Muni Corporation",district = "Thanjavur",radius = 7},
{name="Theni",position = Vector2( 152.881, 518.264 ),group = "Municipality Selection grade",district = "Theni",radius = 5},
{name="Thiruthangal",position = Vector2( 226.776, 596.023 ),group = "Municipality First grade",district = "Virudhunagar",radius = 5},
{name="Thiruthani",position = Vector2( 493.957, 55.7892 ),group = "Municipality Second grade",district = "Tiruvallur",radius = 4},
{name="Thiruthuraipoondi",position = Vector2( 496.865, 442.278 ),group = "Municipality Second grade",district = "Tiruvarur",radius = 4},
{name="Tiruvannamalai",position = Vector2( 412.53, 195.8 ),group = "Municipality Special grade",district = "Tiruvannamalai",radius = 5},
{name="Thiruvathipuram",position = Vector2( 481.22, 131.92 ),group = "Municipality Second grade",district = "Tiruvannamalai",radius = 4},
{name="Thiruverkadu",position = Vector2( 565.821, 71.9008 ),group = "Municipality Selection grade",district = "Tiruvallur",radius = 5},
{name="Thoothukudi",position = Vector2( 277.304, 693.132 ),group = "Muni Corporation",district = "Thoothukudi",radius = 7},
{name="Thuraiyur",position = Vector2( 347.26, 349.14 ),group = "Municipality Selection grade",district = "Tiruchirapalli",radius = 5},
{name="Thuvakudi",position = Vector2( 373.433, 409.261 ),group = "Municipality Second grade",district = "Tiruchirapalli",radius = 4},
{name="Tindivanam",position = Vector2( 496.865, 193.321 ),group = "Municipality Selection grade",district = "Vilippuram",radius = 5},
{name="Tiruchengode",position = Vector2( 241.698, 318.237 ),group = "Municipality Selection grade",district = "Namakkal",radius = 5},
{name="Tiruchirapalli",position = Vector2( 356.63, 402.171 ),group = "Muni Corporation",district = "Tiruchirapalli",radius = 7},
{name="Tirumangalam",position = Vector2( 254.039, 547.287 ),group = "Municipality Second grade",district = "Madurai",radius = 4},
{name="Tirunelveli",position = Vector2( 213.326, 704.799 ),group = "Muni Corporation",district = "Tirunelveli",radius = 7},
{name="Tirupathur",position = Vector2( 344.19, 154.964 ),group = "Municipality Selection grade",district = "Tirupathur",radius = 5},
{name="Tiruppur",position = Vector2( 160.98, 357.688 ),group = "Muni Corporation",district = "Tiruppur",radius = 7},
{name="Tiruvallur",position = Vector2( 534.671, 60.1645 ),group = "Municipality First grade",district = "Tiruvallur",radius = 5},
{name="Tiruvarur",position = Vector2( 494.975, 406.838 ),group = "Municipality First grade",district = "Tiruvarur",radius = 5},
{name="Udhagamandalam",position = Vector2( 67.9207, 313.935 ),group = "Municipality Special grade",district = "Nilgiris",radius = 5},
{name="Udumalaipettai",position = Vector2( 146.439, 434.986 ),group = "Municipality Selection grade",district = "Tiruppur",radius = 5},
{name="Usilampatti",position = Vector2( 227.866, 523.952 ),group = "Municipality Second grade",district = "Madurai",radius = 4},
{name="Valparai",position = Vector2( 107.18, 465.614 ),group = "Municipality Selection grade",district = "Coimbatore",radius = 5},
{name="Vandavasi",position = Vector2( 492.503, 154.964 ),group = "Municipality Second grade",district = "Tiruvannamalai",radius = 4},
{name="Vaniyambadi",position = Vector2( 347.098, 128.712 ),group = "Municipality Selection grade",district = "Tirupathur",radius = 5},
{name="Vedaranyam",position = Vector2( 525.987, 464.844 ),group = "Municipality Second grade",district = "Nagapattinam",radius = 4},
{name="Vellakoil",position = Vector2( 216.234, 383.94 ),group = "Municipality Second grade",district = "Tiruppur",radius = 4},
{name="Vellore",position = Vector2( 421.735, 93.6769 ),group = "Muni Corporation",district = "Vellore",radius = 7},
{name="Vikramasingapuram",position = Vector2( 159.526, 713.55 ),group = "Municipality Second grade",district = "Tirunelveli",radius = 4},
{name="Vilippuram",position = Vector2( 474.037, 236.491 ),group = "Municipality Selection grade",district = "Vilippuram",radius = 5},
{name="Virudhachalam",position = Vector2( 450.336, 300.809 ),group = "Municipality First grade",district = "Cuddalore",radius = 5},
{name="Virudhunagar",position = Vector2( 249.677, 580.345 ),group = "Municipality Selection grade",district = "Virudhunagar",radius = 5},
{name="Walajapet",position = Vector2( 448.009, 80.4413 ),group = "Municipality Second grade",district = "Ranipet",radius = 4}]

var df
func init_label_font():
	var f=load("res://DroidSans.ttf")
	df=DynamicFont.new()
	df.font_data=f
	df.size=18

var stats={}
#counts for each city type per district 
func init_stats():
	for i in Cities:
		if i.district in stats:
			if i.group in stats[i.district]:
				stats[i.district][i.group]+=1
			else:
				stats[i.district][i.group]=1
		else:
			stats[i.district]={}
			stats[i.district][i.group]=1

#Cities dict is grouped by District in of to enable $Cities.of[x] 
var of={}
func group_by_district():
	for i in Cities:
		if i.district in of:
			of[i.district].append(i)
		else:
			of[i.district]=[i]
			
func _ready():
	init_label_font()
	#init_stats()
	group_by_district()
	update()

var mtype='all'
var district='all'
var city=''
var cpos
var crad

func _draw():
	if city!='':
		draw_string(df, cpos, city, 'f92672')
		draw_circle(cpos, crad, 'ff2207')
		return
	if district=='':
		return
	if district == 'all':
		for i in Cities:
			if i.group==mtype:
				var p=i.position 
				draw_string(df, p+Vector2(15, 0), i.name, 'f92672')		
				draw_circle(p, i.radius, 'ff2207')		
	else:
		for i in Cities:
			#print(i.name, ' ', i.x,' ', i.y)
			if i.group==mtype and i.d == district:
				var p=i.position 
				draw_string(df, p+Vector2(15, 0), i.name, 'f92672')		
				draw_circle(p, i.radius, 'ff2207')

func clear():
	_draw_cities('','','')

#func _draw_city(c,p,r):
#	_draw_cities('', '', c,p,r)

func _draw_cities(d, munitype, c='',p=0,r=0):
	
	if d !='' and munitype!='':
		show()
		mtype=munitype
		district=d
		update()
	else:
		if c!='':
			show()
			city=c
			crad=r
			cpos=p
			update()
			return
		mtype=''
		district=''
		city=''
		crad=0
		cpos=0
		hide()	
