extends Node

var neighbours={
Ariyalur=["Cuddalore","Perumbalur","Thanjavur","Tiruchirapalli",],
Chengalpattu=["Chennai","Kanchipuram","Tiruvallur","Tiruvannamalai","Vilippuram",],
Chennai=["Chengalpattu","Tiruvallur",],
Coimbatore=["Erode","Nilgiris","Tiruppur",],
Cuddalore=["Ariyalur","Kallakurichi","Perumbalur","Vilippuram","Mayiladithurai",],
Dharmapuri=["Kallakurichi","Krishnagiri","Salem","Tiruvannamalai",],
Dindigul=["Karur","Madurai","Theni","Tiruchirapalli","Tiruppur",],
Erode=["Coimbatore","Karur","Namakkal","Salem","Nilgiris","Tiruppur",],
Kallakurichi=["Cuddalore","Dharmapuri","Perumbalur","Salem","Tiruvannamalai","Vilippuram",],
Kanchipuram=["Chengalpattu","Ranipet","Tiruvallur","Tiruvannamalai",],
Kanyakumari=["Tirunelveli",],
Karur=["Dindigul","Erode","Namakkal","Tiruchirapalli","Tiruppur",],
Krishnagiri=["Dharmapuri","Tirupathur","Tiruvannamalai",],
Madurai=["Dindigul","Sivagangai","Theni","Virudhunagar",],
Mayiladithurai=["Cuddalore","Thanjavur","Tiruvarur",],
Nagapattinam=["Thanjavur","Tiruvarur",],
Namakkal=["Erode","Karur","Salem","Tiruchirapalli",],
Nilgiris=["Coimbatore","Erode",],
Perumbalur=["Ariyalur","Cuddalore","Kallakurichi","Salem","Tiruchirapalli",],
Pudukotai=["Ramanathapuram","Sivagangai","Thanjavur","Tiruchirapalli",],
Ramanathapuram=["Pudukotai","Sivagangai","Virudhunagar",'Thoothukudi'],
Ranipet=["Kanchipuram","Tiruvallur","Tiruvannamalai","Vellore",],
Salem=["Dharmapuri","Erode","Kallakurichi","Namakkal","Perumbalur","Tiruchirapalli",],
Sivagangai=["Madurai","Pudukotai","Ramanathapuram","Tiruchirapalli","Virudhunagar",],
Tenkasi=["Thoothukudi","Tirunelveli","Virudhunagar",],
Thanjavur=["Ariyalur","Pudukotai","Tiruchirapalli","Nagapattinam","Mayiladithurai","Tiruvarur",],
Theni=["Dindigul","Madurai","Virudhunagar",],
Thoothukudi=["Tenkasi","Tirunelveli","Virudhunagar","Ramanathapuram"],
Tiruchirapalli=["Ariyalur","Dindigul","Karur","Namakkal","Perumbalur","Pudukotai","Salem","Sivagangai","Thanjavur",],
Tirunelveli=["Kanyakumari","Tenkasi","Thoothukudi",],
Tirupathur=["Krishnagiri","Tiruvannamalai","Vellore",],
Tiruppur=["Coimbatore","Dindigul","Erode","Karur",],
Tiruvallur=["Chengalpattu","Chennai","Kanchipuram","Ranipet",],
Tiruvannamalai=["Chengalpattu","Dharmapuri","Kallakurichi","Kanchipuram","Krishnagiri","Ranipet","Tirupathur","Vellore","Vilippuram",],
Tiruvarur=["Thanjavur","Nagapattinam","Mayiladithurai",],
Vellore=["Ranipet","Tirupathur","Tiruvannamalai",],
Vilippuram=["Chengalpattu","Cuddalore","Kallakurichi","Tiruvannamalai",],
Virudhunagar=["Madurai","Ramanathapuram","Sivagangai","Tenkasi","Theni","Thoothukudi",]
}

var citygrades=['','Muni Corporation','Municipality Selection grade','Municipality Special grade','Municipality First grade','Municipality Second grade']

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
{name="Manapparai",position = Vector2( 317.272, 430.962 ),group = "Municipality First grade",district = "Tiruchirapalli",radius = 5},
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


#code facttype - p:people, f:food, m:movies, c:culture/temples/religion related, h:history 
var facts:={
		Ariyalur=[
			'h:fields of Cretaceous age marine fossils (100 millions year old) are found here showcased in the Museum at Varanavasi', 
			'h:Gangaikonda Cholapuram located here was the capital of the Chola Empire before it moved to Tanjore',
			"h:The ruins of the Chola capital and the famous Temple here are now a World Heritage site",
			"District was created in 2007 from the southern part of Perumbalur district"
			],
		Chennai=[
			"Kasimedu fishing harbour is the largest Fish Auction site in the country moving more than 200 tons of fish a day",
			"State Capital with 10% of the states population", 
			"Marina Beach, India's longest and the Worlds second longest beach is located here", 
			"Center of the Tamil Film Industry nicknamed Kollywood, as most studio were built in the Kodambakkam neighbourhood",
			"Valluvar Kottam, built in honor of Tamil poet Thiruvalluvar"],
		Chengalpattu=[
			'District was created in 2019 from Kanchipuram',
			'h:World heritage site of 7th century monuments, temples and caves at Mahabalipuram',
			"Named after the Sengazhuneer poo (Red White Lily) that grows in abundance along the river banks",
			"h:Mahaballipuram site of some of the earliest Rock Temples and Stone Sculpture that influenced the style of Temple Architecture throughout South India"],
		Coimbatore=[
			"Location of India's first Insect Museum with a collection of 20000 Insects",
			'G. D. Naidu, known as the Edison of India, was from here. His inventions and entrepreneurship turned the region into a industrial hub',
			'f:Kalakki meaning to mix is popular street food here (super soft omelet with masala)',
			'Wet Grinder used for idli/dosa was invented here. More than 800 factories manufacture it and the area has received the GI Tag from Govt of India',
			'Eastern end of the Palakkad Gap, the lowest pass through the Western Ghats linking Kerala and Tamil Nadu. Also called Kovai',
			'Manchester of South India due to extensive textile industry, fed by the surrounding cotton fields',
			'p:C Subramaniam, Bharath Ratna Awardee for his role in Indias Agri/Dairy Revolution was from Pollachi located here'		
		],
		Cuddalore=[
			'Along with Vilipuram this District was created from breakup of South Arcot in 1993',
			'f:A large portion of Cashew Nut production of the state happens here in Panruti',
			'c:Nataraja dance at thilai Natyanjali Dance Festival feb march on mahashivratri expand...',
			'Pichawaram mangrove forests',
			'Koodalur means confluence in Tamil. It is the place where the Pennaiyar, Kedilam, Paravanar and Uppanaar rivers join',
			'Neyveli Lignite Corporation is located here. The mining and power generation giant was given the Navratna status in 2011',
			'h:Was known as Naadu Nadu or the middle kingdom betweene Cholas in the South and the Pallavas in the North', 
			"h:Fort St David in Cuddalore was one of the main British trading posts controling their activities in South India in the early 1700. So Cuddalore became the site of multiple wars with the French based 25kms North in Pondicherry",
			"Silver Beach is one of the longest beaches found on the Coromandel Coast. 2700 people lost their life here during the 2004 Tsunami", 
			'c:Chidambaram temple',
			'Pichawaram Mangrove forests'],
		Dindigul=[
			'Created in 1985 from the northern part of Madurai district',
			'f:Periyakottai Brinjal', 
			'Palani Murugan temple located here on the Sivagiri hill, sees 7 million pilgrims a year',
			"f:the famous Palani temples Panchamirtham, sweet made of 5 ingredients- banana, jaggery, cow ghee, honey and cardamom",
			"Kodaikanal Malai Poondu (Hill Garlic) known for its medicinal properties and long shelf life has been given a GI Tag",
			'Kodaikanal, in tamil translates to The Gift of the Forest, is very popular hillstation located here',
			'Palani Hills part of Western Ghats lies within this district. Its where the famous Liril commercial was shot'],
		Dharmapuri=[
			'District was created in 1965 from northern part of Salem district',
			"m:Hogenakkal falls shot to fame after Chinna Chinna Asai (Roja), Mazhaiye Mazhaiye(Rhythm) and Raath Ka Nasha Abhi (Asoka) were shot here",
			"Hogenakkal falls, which means smokey rocks, is where the river Cauvery enters Tamil Nadu",
			"Taking a ride in the local bowl shaped boats made of woven grase called a Parisal/Coracle is very popular tourist activity here",
			"p:Veeraappan, the notorious elephant poacher, sandalwood smuggler, wanted for the murder of 184 people was caught here"],
		Erode=[
			'District was created from Coimbatore in 1979',
			"Turmeric or Manjal from here is known for its unique color. The area is the 2nd largest Tumeric market in India) and major exporter",
			"Jamakkalam Carpets and Blankets made by the weavers of Bhavani are world famous for their patterns",
			"Agri powerhouse due to rivers and dams",
			"Sathyamangalam Tiger Reserve home to 83 tigers and 111 Leopards",
			"p:Freedom fighter Tiruppur Kumaran was born here. Protesting the arrest of Gandhi in 1932, while holding a banned Flag of India he was beaten to death by the British Police",
			"p:E V Ramasamy known as Periyar or Father of Dravidian movement to eradicate caste inequality that lead to emergence of DMK & ADMK was from here"
		],
		Kanyakumari=[
			"Martandam town located here is famous for honey production",
			'On the UN Human Development Index this district comes first within the state',
			'Indias largest wind power farm is located her at Muppandal. Its the 3rd largest in the world',
			'the tiny village of Vadaserry famous for crafting Temple Jewellery with red and green stones or kuchu kal',
			"f:Nanjilnadu cuisine Puttu, Appam, Idiappam, Seafood, Coconut oil based",
			"Southern most district of TN and the Indian main land",
			"Nagarcoil is the District HQ",
			"The only district of TN facing the Arabian Sea",
			"The ancient Kani tribe living in the Western Ghats recently discovered tree climbing crabs in this biodiversity hotspot"],
		Kanchipuram=[
			"District HQ is Kanchipuram also known as the City of a Thousand Temples",
			"h:Capital of the Panllava Kingdom from the 4th to the 9th Century",
			"p:Headquarters of the Kanchi matha, founded by Adi Sankaracharya",
			"Famous for the hand woven silk sarees, the Kanchi Pattu Pudavai. Wedding saree being a speciality",
			"Silk from here has received the GI Tag",
			"p:C N Annadurai, Founder of the DMK and 1st Chief Minister of Tamil Nadu State was from here",
			"c:Ekambareswarar Temple covers 25 acres is one of the largest temple complexes in India. The Southern Gopuram is 11 stories tall making it one of the taller temple towers. Showcasing the architecture of the Vijayanagara dynasty",
			"c:Kailasanathar Temple, panamalai talagireeshwarar and the Vaikunta Perumal Temple found here are nearly 1350 years old",
			"h:Gunduperumbedu fossil bed where plant fossils from 400 million years ago, called poo-kal by locals are found in abundance"
		],
		Krishnagiri=[
			"p:Birthplace of C. Raja Gopalachari popularly known as Rajaji, the first Governor General of India and first Chief Minister of Madras State",
			"Largest producers of Mangoes in India",
			"Largest city here is Hosur 40 km from Bangalore and a major manufacturing hub",
			"The TVS 50, Indias first two seat moped was manufactured here in Hosur and was a big hit. More than 10 million mopeds being sold since.",
			'District was created in 2004 from the northern part of Dharmapuri district'
		],
		Kallakurichi=[
			'Mainly a rural area 50 years ago increased road connectivity has turned into an emerging agricultural hub.',
			'The Kalvarayan Hills are pristine unexplored area with the Vellimalai hilltop becoming a popular tourist spot for locals during the monsoon season.',
			'The famous Koovagam festival held by the transgender community reenacts Krishna transforming into Mohini to marry a Prince Aravan',
			'Was created from the eastern part of Vilippuram district in 2019'],
		Karur=[
			"h:Capital of the Chera Kings who ruled Western Tamil Nadu/Central Kerala at various times from the 1st to 12th Century", 
			"h:A ancient trade post with the Romans who called it Karoura. They traded gold for rice. So the word rice comes from the Tamil araci", 
			"TN Newsprint and Papers Ltd TNPL located here is the largest sugarcane based paper mill in the world",
			'District was created in 1995, along with Perumbalur from northern part of Tiruchirapalli district',
		],
		Perumbalur=[
			'h:Ranjankudi Fort built in the 17th century',
			'Arambavur hand made wood carvings. The artisans of this village are famous and their carvings have recieved a GI Tag',
			'Leads the state in Small Onion production',
			'h:The Karai badlands - a geological heritage site - were marine fossils from the Cretaceous period have been found',
			'h:An 18m long 120 million year old tree (kal-maram) found here (Sathanur Fossil Park) is evidence that the area was under a shallow sea during the Cretaceous period',
			'District was created in 1995, along with Karur from Tiruchirapalli district',
			],
		Pudukotai=[
			'District was created from western part of Thanjavur district in 1974',
			'Moi Virundhu, a tradional practice where money is raised from the community by inviting everyone for a feast',
			'Famous for its Percussinists, Manpoondia Pillai the lantern bearer, one handed kanjira, mirdangams...',
			'Narthamalai, malaiyadapatti paintings show the differences between the chola and pallava art',
			'h:Was a independent princely state ruled  by the Thondaimans since the 17th century'],
		Mayiladithurai=[
			'District was created from the coastal part of Tirvarur in 2020', 
			'Ancient Port town of Poombuhar where the Kaveri meets the sea ',
			'Kaveri Pushkaram festival happens here every 12 yeara place where peacock dance'],	
		Madurai=[
			'p:M S Subbulakshmi, the first musician to receive the Bharat Ratna was born here',
			'm:Thirumalai Nayakkar Palace built in 1636, blends North and South Indian architecture, site of famous movie songs Kannalanea(Bombay), Tere Bina(Guru), Ragasiya Kanavugal(Bheemaa)',
			'Chithirai Festival',
			"Thoonga Nagaram, meaning the city which never sleeps",
			'the beautiful Sungudi sarees. Gujarati weavers, moved here 500 years ago, seeing the local women tying their hair in buns created the now famous tye and die pattern of these sarees',
			'f:bun parotta and kulambu, muttaiparotta (minced parotta and scrambled egg)',
			'f:jigarthanda a drink made with almond gum and the syrup of the sarsaparilla plant',
			'f:paruthipal (made of cottonseeds and jaggery), thengai pal (a warm sweetened coconut milk drink)', 
			'f:keerai vada (a unique, thin fritter made with a medicinal plant called mullu murungai)',
			'c:The Meenakshi Amman Temple is one of the largest temple complexes in the state with 14 Gopurams (Gateway Towers), 33000 scupltures, a thousand pillared hall, tank legend, parrots...',
			'Many areas well known for conducting the Jallikattu (bull taming) ceremony during the Pongal (harvest festival) season',
			'Jasmine (Madurai Malli)'
		],
		Nagapattinam=[
			'p:V. R. Nedunchezhiyan, founder of DMK and Finance Minister under 4 CMs Annadurai, MGR, Karunanidhi & Jayalalitha was born here',
			'Created in 1991 along with Tiruvarur from coastal part of Thanjavur district',
			'p:Sambandar of Sirkazhi and his opposition to the Jains, basis of the bakthi movement. Author of the Thirumarai  ', 
			'c:Velankanni festival', 
			'Was hit by the 2004 Tsunami 6000 lives lost', 
			'The Danish Fort at Tarangabadi is located here' 
		],
		Nilgiris=[
			'the famous 170 year old Botanical Garden on the lower slopes of the Doddabetta peak',
			'Vegetable, Fruit and Spice Festival at Coonoor, Kotagiri and Gudalor are very popular',
			'Summer Festival at Ooty every May is a huge tourist attraction includes the famous Flower Show (3000 rose varieties), Boat Races and a Dog Show',
			'Half the HydroElectric power of the state is generated here at Pykara, Kundah, Moyar',
			'Pykara Dam is one of the oldest Hydraulic Power Plants in South India',
			'Mountain railway here is a World Heritage site for its ingenious engineering through a rugged, mountainous terrain',
			'Doddabetta Peak the highest point in TN at 2600m is located here',
			'Home of the native hill Toda and Badaga tribes',
			"Udhagamandalam or Ooty known as the Queen of Western Ghats is a hillstation located here. It is the district HQ.",
			'Coffee, tea, rubber, eucalyptus plantations',
			'Mudumalai Tiger Reserve is the largest in TN with 160 using the corridor and 103 resident ' ],
		Namakkal=[
			'District was created in 1997 from southern part of Salem district',
			'p:Chairman of the Tata Group, N Chandrasekaran was born here',
			'p:The R in R K Narayan and R K Laxman refers to the town of Rasipuram located here',
			'f:The famous nutty flavoured Ghee made in Rasipuram, from cattle raised in the Kolli Hills used in nei dosa and mysore pak',
			'With the fall of the Cholas in the 12th Century, for a breif period Sendamangalam located here became the capital of the Kadava kings',
			'Cauvery flows through the town of Tiruchengode located here',
			'Known for its Poutry Farms and  Lorry body building industry', 
			'Its name derives from Namagiri, the name of the single 65m high rock formation at the center of the Namakkal town. A Fort covering one and half acres was built on top of the rock in the 17th century'],
		Ranipet=[
			"f:The famous Ambur biryani. The Mughals ruled this region and influenced the cuisine. Unique due to local type of rice used, and cooking meat and rice together unlike other biriyanis separately",
			"f:Arcot Makkan Peda is a speciality - a flattened gulab jamun but filled with grated dry fruits soaked in sugar syrup",
			"Leather goods manufacturing hub",
			'End point of the first Passenger Railway Line built in South India in 1854 - Walajahpet-Veyasarapady (Chennai)',
			'Built on the Palar River banks, by the Nawab of Arcot, in honour of the Rani of Gingee who committed Sati after her husband Desingh died in the Battle of Gingee',
			'District was formed from eastern parts of Vellore district in 2019',
			],
		Ramanathapuram=[
			"p:Birth place of A.P.J Abdul Kalam, rocket man, pokhran 2, peoples president...",
			"Hi! I am Abdul. Welcome to Pamban Island",
			'According to legend the site from which Ramas Army builds a bridge over the ocean to Lanka',
			"Mandapam - Pamban Bridge - Pamban-Rameshwaram/Dhanushkodi",
			"In 1964 a cyclone hit Pamban Island with 25 ft waves washing away the town of Danushkodi. Today the remain of the ghost town are a tourist attraction."
		],
		Salem=[
			'The World best Magnesite deposits are found here in the Chalk Hills',
			'Silver anklets or kolasu make up 60% of silver ornaments sold in India',
			'Silk Saree weavers of Panjukalipatti',
			'f:Essence Dosa',
			'f:Thattu vadai settu is very common snack found here - thattai smeared with chutney topped with shredded beetroot, carrot and onion',
			'Silk, or Venpattu, from here has received the GI tag',
			'Steal industry',
			'Mettur Dam, on the Cauvery river is the largest dam in the state', 
			'Shevaroy Hills - yercaud - orchidarium - old coffee plantations highest peak of the southern eastern ghats in TN - lots of species of snake, lizard, frogs and birds not found anywhere else'],
		Sivagangai=[
			'District was carved out of Ramanathapuram district in 1985 along with Virudhunagar',			
			'm:Karaikudi, with its Chettiar palaces is a very popular film location. Aathangudi palace, Rao Bahadur palace and nearly 50 other palatial houses are occupied on most days by film crew',
			'Kottan basket weaving from palm leafs with its vibrant colors',
			'p:Kaniyan - Yaadhum Oore Yaavarum Kelir',
			'Chettinad formed by a prosperous banking and business community built from trading with Burma, Ceylon and Malaysia',
			'Athangudi tiles',
			'h:home of the famous Maruthu Brothers who fought the East India Company in the Polygar Wars', 
			'f:Known for the famous Chettinad cuisine',
			'h:Found here is the 2500 year old Keezhadi excavation site, including plates with the Tamil-Brahmi script'
		],
		Theni=[
			'Cumbum is famous for the bullock cart (rekhla) racing. Races are held here every year during the Muthalamman temple festival',
			'The fertile Cumbum valley between the Thekkadi Hills and Kodaikanal Hills is the only region in the country where Grapes can be produced year round',
			'p:Ilaiyaraaja, the famous film composer, for more than a 1000 movies, was born here in Pannaipuram.',
			'Cardamom estates',
			'Indian Neutrino Observatory',
			'The Meghamalai range also called the High Wavy Mountains',
			'Meghamalai Wildlife Sanctuary'],
		Tiruvarur=[
			'Formed in 1991 along with Nagapattinam from eastern part of Thanjavur district',
			'c:Somaskanda art - In a style unique to the area Murugan is depicted surrounded by Shiva and Parvathi',
			'c:Thyagaraja Temple Chariot found here stands 96 feet tall',
			'p:Birthplace of Saint Thyagaraja, the composer of Carnatic music'	
		],
		Thanjavur=[
			'p:M. S. Swaminathan, was born here in Kumbakonam, called the Father of the Green Revolution for increasing food production in the country',
			'The famous painting style which uses gold foil, glass beads and gems over the painting done on wood. Locals call it palagai padam or wood picture', 
			'Art plates of the region have received the GI Tag',
			'Netti Workds',
			'Bronze idols and statues made by the artisans of Swamimalai is a thousand year old craft',
			"The Rice Bowl of Tamil Nadu",
			"Popularized Ghee Pongal and Puliyodarai (tamarind rice)",
			"c:Kumbakonam, every 12 years Mahamaham festival draws millions of devotees for a dip in the huge temple tank complex spanning 20 sq acres",
			"p:Srinivasa Ramanujam, untrained in maths, turned out to be one of the greatest Mathematicians of all time, grew up here in Kumbakonam",
			"c:The 1000 year old Brihadeshwara temple",
			"h:Seat of the Chola Empire and now a World Heritage site",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Tirunelveli=[
			"f:Halwa made famous by the Iruttukadai Halwa shop. Halwa was made through the day and sellout within minutes of shop opening at night", 
			"Kudrevatti hill station",
			"m:Kalyani Theertham and Agasthya falls were Azhagaana Raakshasiye from Mudhalvan was shot",
			"Korai grass (reed) mats of Pattamadai called Pattamadai Pai",
			"ISROs Rocket Engines are assembled and tested at Mahendragiri located here",
			"p:Agastyamalai mountain is a popular pilgrimage site to Sage Agastya considered father of the Tamil Language",
			"Kalakkad Mundanthurai Tiger Reserve (KMTR) wildlife include Lion tailed Macaques, Elephants, Tigers, Peacock, Nilgiri Langur, Gaur amd Leopards"],
		Tiruvannamalai=[
			'Along with Vellore this district was created from breakup of North Arcot in 1989',	
			"the famous Karthigai Deepam festival is held here, a 10 foot tall lamp is lit at the top of the Arunachala hill",
			"Arni silk production",
			"Largest Rice producers",
			"Pilgrims come here to do a 14 km walk around the Arunachala hill, a practice called Girivalam",
			"Arunachaleswara temple, its huge eastern Gopuram is 217 feet tall,  built by Emporer Krishna Deva Raya in 1516",
			"Sathanur Dam is located here, with its popular crocodile park and fish farms",
		],
		Tiruvallur=[
			'p:Sarvepalli Radhakrishnan, the Second President of India, was born here in Tiruttani.',
			'Pulicat town found at the tip of Pulicat Lake',
			'Casuarinas',
			'c:Tiruttani Murgan temple - Aadi Krittikai - kavadis',
			'Very industrialized district manufacturing everything from cycles, tanks to trains'],
		Thoothukudi=[
			'District was created in 1986 from eastern part of Tirunelveli district',
			'p:Shiv Nadar, Founder of the IT Giant HCL Technologies was born here',
			"h:Korkai located here, was ancient pearl port and capital of the Pandya Kings before they moved to Madurai",
			"f:the famous Kovilpatti Kadalai Mittai a groundnut and jaggery candy",
			"ISRO is building its new space port here at Kulasekharapatnam ",
			"Known in the past as the Pearl Fishery Coast", 
			"p:Veerapandiya Kattabomman",
			"p:great poet Subramanya Bharathi",
			"p:V.O.Chidambaram Pillai Swadeshi Steamship Company",
			"dugong sea grass medows"],
		Tiruppur=[
			'District was created in 2007 from east part of Coimbatore District',
			"Hosiery products. Famously called the Baniyan City or Dollar City for its textile exports", 
			"Half of Indias knitwear, innerwear exports to global brand names comes from here employing more than a 11 lak people",
			"Coins from 2000 years ago found here in Kodumanal, indicate cotton trade route with Rome"],
		Tirupathur=[
			'Vermiculite deposits and mining. The mineral is used in insulators, ceramics and agriculure',
			'The Vainu Bappu Observatory one of the main centers of Indian Astronomy',
			'Surrounded by the Javadhu and Yelagiri Hills known for rivers, waterfalls and sandal wood trees'
			],
		Tiruchirapalli=[
			'Birth place of Suppandi, Hero of Tinkle Comics',
			'f:The famous Imam Pasand Mangos of Thathachariar Gardens in Srirangam',
			'p:C V Raman was born here, the first Asian to win the Nobel Prize in Physics, to answer the question if a glass of water is transparent why is the sea blue?',
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
			'p:Sivaji Ganesan, an Icon of Tamil Cinema was born here',
			'Along with Cuddalore this District was created from break up of South Arcot in 1993',
			"Surrounds the union teritory of Pondicherry",
			"h:National Fossil Wood Park at Tiruvakkarai has fossilized trees that are nillions of years old",
			"h:Gingee Fort is found here. Sivaji called it the most impregnable fortress in India"
		],
		Virudhunagar=[
			'District was carved out of Ramanathapuram district in 1985 along with Sivagangai',
			'f:Srivilliputtur Palkova, a sweet made from cow milk and sugar',
			"p:Birth place of K. Kamaraj TN CM from 54-63, and Indian National Congress President after Jawaharlal Nehru's death. He made education free for the poor having had to drop out of school at age 11 to support his family",
			'Sivakasi Fireworks',
			'p:R G Chandramogan, founder of Arun IceCream and Hatsun Group, one of the largest private diary groups in the country',
			'c:The 192 ft Gopuram of the Srivilliputhur Temple built here, dedicated to Andal the only woman among the poet saints of south india, is the symbol of the Tamil Nadu Govt'
		],
		Vellore=[
			'Ranipet district was formed from eastern parts of this district in 2019',
			'Along with Tiruvannamalai this district was created from breakup of North Arcot in 1989',
			"Top exporter of finished Leather goods in the country accounting for 37% of Indian leather exports",
			"h:500 year old Vellore Fort is a popular tourist attraction. Was location of the 1806 Sepoy Mutiny against the British"
		]
	}

var years=["1956","1965","1974","1979","1985",
"1985x2","1986","1989","1991",
"1993","1995","1996","1997","1997x2",
"2004","2007","2007x2",
"2019","2019x2","2019x3","2019x4","2019x5",
"2020"]

var history=[{
	Salem=[['Salem', 'Dharmapuri', 'Namakkal', 'Krishnagiri'],Color.mediumspringgreen],
	Coimbatore=[['Tiruppur', 'Coimbatore', 'Erode'], Color.darkgreen],#006400
	Madurai=[['Madurai', 'Dindigul', 'Theni'], Color.lightgreen],#90ee90
	Ramanathapuram=[['Ramanathapuram', 'Sivagangai','Virudhunagar'], Color('fffa90')], #fffacd
	Tirunelveli=[['Tirunelveli', 'Thoothukudi', 'Tenkasi'], Color.honeydew],#f0fff0
	"North Arcot":[['Tiruvannamalai', 'Vellore', 'Tirupathur','Ranipet'],Color.indigo],
	"South Arcot":[['Cuddalore','Vilippuram','Kallakurichi'], Color.violet],
	"Chinglepet":[['Chengalpattu','Kanchipuram','Tiruvallur'],Color('aa22aa')],
	"Tiruchirapalli":[['Karur','Tiruchirapalli','Perumbalur','Ariyalur'],Color('ffd711')], #fa8072
	Thanjavur=[['Pudukotai','Thanjavur','Tiruvarur','Nagapattinam','Mayiladithurai'],Color.peachpuff], #ffda89
	Madras=[['Chennai'], Color.lightgoldenrod],
	Nilgiris=[['Nilgiris'],Color('adff2f')],
	Kanyakumari=[['Kanyakumari'],Color.gold],
	},
	{
		Salem=[['Salem','Namakkal'], Color.mediumspringgreen],
		Dharmapuri=[['Dharmapuri','Krishnagiri'],Color.mediumspringgreen.darkened(.4)]
	},
	{
		Thanjavur=[['Thanjavur','Tiruvarur','Nagapattinam','Mayiladithurai'],Color.peachpuff], #ffda89
		Pudukotai=[['Pudukotai'], Color.peachpuff.darkened(.3)]
	},
	{
		Coimbatore=[['Tiruppur','Coimbatore'], Color.darkgreen],#006400
		Erode=[['Erode'], Color.darkgreen.lightened(.2)]
	},
	{
		Ramanathapuram=[['Ramanathapuram'], Color('fffa90')],
		Sivagangai=[['Sivagangai'], Color('fffa90').lightened(.2)],
		Virudhunagar=[['Virudhunagar'], Color.lightgreen.lightened(.3)], #fffacd
	},
	{
		Madurai=[['Madurai','Theni'], Color.lightgreen],
		Dindigul=[['Dindigul'], Color.lightgreen.lightened(.1)],
	},
	{
		Tirunelveli=[['Tirunelveli','Tenkasi'],Color.honeydew],#f0fff0
		Thoothukudi=[['Thoothukudi'],Color.honeydew.darkened(.2)]#f0fff0
	},
	{
		"North Arcot":[[],Color.transparent],
		Tiruvannamalai=[['Tiruvannamalai','Tirupathur'],Color.indigo],
		Vellore=[['Vellore','Ranipet'],Color.indigo.lightened(.3)]
	},
	{
		Thanjavur=[['Thanjavur'], Color.skyblue], #ffda89
		Tiruvarur=[['Tiruvarur','Mayiladithurai'], Color.skyblue.darkened(.2)], #ffda89
		Nagapattinam=[['Nagapattinam'], Color.skyblue.darkened(.4)] #ffda89
	},
	{
		"South Arcot":[[],Color.transparent],
		"Cuddalore":[['Cuddalore'], Color.violet],
		"Vilippuram":[['Vilippuram','Kallakurichi'], Color.violet.lightened(.3)],
	},
	{
		'Tiruchirapalli':[['Tiruchirapalli'], Color('ffd711')],
		"Perumbalur":[['Perumbalur','Ariyalur'], Color('ffd711').darkened(.2)],
		"Karur":[['Karur'], Color('ffd711').darkened(.4)]
	},
	{
		Madurai=[['Madurai'], Color.lightgreen],#90ee90
		Theni=[['Theni'], Color.lightgreen.darkened(.3)]#90ee90
	},
	{
		Salem=[['Salem'], Color.mediumspringgreen],
		"Namakkal":[['Namakkal'], Color.mediumspringgreen.darkened(.3)],
	},
	{
		"Chinglepet":[[],Color.transparent],
		"Tiruvallur":[['Tiruvallur'],Color('aa22aa')],
		"Kanchipuram":[['Chengalpattu','Kanchipuram'],Color('bb55bb')],
	},
	{	Dharmapuri=[['Dharmapuri'],Color.mediumspringgreen.darkened(.4)],
		"Krishnagiri":[['Krishnagiri'],Color.mediumspringgreen.darkened(.7)]
	},
	{
		"Perumbalur":[['Perumbalur'],Color('ddd711')],
		"Ariyalur":[['Ariyalur'],Color('ddd711').lightened(.3)]
	},
	{
		Coimbatore=[['Coimbatore'], Color.darkgreen],
		"Tiruppur":[['Tiruppur'], Color.darkgreen.lightened(.5)],
	},
	{
		Tirunelveli=[['Tirunelveli'],Color.honeydew],
		"Tenkasi":[['Tenkasi'],Color.honeydew.darkened(.3)],
	},
	{
		"Vilippuram":[['Vilippuram'], Color.violet.lightened(.3)],
		"Kallakurichi":[['Kallakurichi'], Color.violet.lightened(.8)],
	},
	{
		Tiruvannamalai=[['Tiruvannamalai'],Color.indigo],
		"Tirupathur":[['Tirupathur'],Color.indigo.darkened(.4)],
	},
	{
		Vellore=[['Vellore'],Color.indigo.lightened(.3)],
		"Ranipet":[['Ranipet'],Color.indigo.lightened(.6)],
	},
	{
		"Kanchipuram":[['Kanchipuram'],Color('bb55bb')],
		"Chengalpattu":[['Chengalpattu'],Color('bb55bb').darkened(.4)],
	},
	{
		Tiruvarur=[['Tiruvarur'],Color.skyblue.darkened(.2)], #ffda89
		"Mayiladithurai":[['Mayiladithurai'],Color.skyblue.darkened(.6)], #ffda89
	}
	]
